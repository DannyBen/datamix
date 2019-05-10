require 'spec_helper'

using DataMix

describe CSV::Table do
  let(:subject) { CSV.table 'spec/fixtures/basic.csv' }
  
  describe "#delete_empty_rows" do
    let(:subject) { CSV.table 'spec/fixtures/delete_empty_rows.csv' }

    it "removes rows if one or more values are nil" do
      before_count = subject.count
      subject.delete_empty_rows
      expect(subject.count).to be < before_count
      subject.each do |row|
        expect(row.fields).not_to include nil
        expect(row.fields).not_to include ''
      end
    end
  end

  describe "#derive" do
    let(:result) { subject.derive{ |index| subject[index][:value] * 2 } }

    it "returns an array" do
      expect(result).to be_an Array
    end

    it "converts values based on the given block" do
      expect(result).to eq [4,8,12]
    end

    it "can be assigned to a new column" do
      subject[:new_col] = result
      expect(subject.headers).to eq [:date, :day, :value, :new_col]

    end
  end

  describe "#extract" do
    let(:result) { subject.extract(/\d{4}/, from: :date) }

    it "returns an array" do
      expect(result).to be_an Array
    end

    it "converts values based on the regular expression" do
      expect(result).to eq ['2017', '2017', '2017']
    end

    it "can be assigned to a new column" do
      subject[:new_col] = result
      expect(subject.headers).to eq [:date, :day, :value, :new_col]
    end
  end

  describe "#iterate" do
    let(:result) { subject.iterate { |index| subject[index][:value] *= 3 } }

    it "returns a table with :col_or_row mode" do
      expect(result.mode).to eq :col_or_row
    end

    it "executes the given block" do
      expect(result[:value]).to eq [6, 12, 18]
    end
  end

  describe "#join" do
    let(:other) { CSV.table 'spec/fixtures/join_me.csv' }

    it "should merge with another csv on a given column" do
      subject.join other, on: :date
      expect(subject.to_ascii).to match_fixture('join.txt')
    end

    context "with columns that exist in both tables" do
      it "should prefix the secondary column with an underscore" do
        subject.join other, on: :date
        expect(subject.headers).to include '_value'
      end
    end

    context "when the join-column does not exist in source" do
      it "should raise an exception" do
        expect{subject.join other, on: :notfound}.to raise_error CSVError, "No such column 'notfound' in source"
      end
    end

    context "when the join-column does not exist in other" do
      it "should raise an exception" do
        expect{subject.join other, on: :day}.to raise_error CSVError, "No such column 'day' in other" 
      end
    end

    context "with non unique join-column" do
      let(:other) { CSV.table 'spec/fixtures/join_me_non_uniqe.csv' }
      it "should raise an exception" do
        expect{subject.join other, on: :date}.to raise_error CSVError, "other[date] is not unique"
      end
    end
  end

  describe "#keep" do
    it "only keeps the requested columns" do
      subject.keep :date, :value
      expect(subject.headers).to eq [:date, :value]
    end
  end

  describe "#preview" do
    it "prints a pretty table" do
      expect{subject.preview}.to output_fixture('basic.txt')
    end
  end

  describe "#remove" do
    it "only removes the requested columns" do
      subject.remove :day, :value
      expect(subject.headers).to eq [:date]
    end
  end

  describe "#rename" do
    it "renames a column" do
      test_value = subject[:date].first
      expect(subject.headers).to include :date
      expect(test_value).not_to be_empty
      
      subject.rename :date, to: :month
      
      expect(subject.headers).not_to include :date
      expect(subject.headers).to include :month
      expect(subject[:month].first).to eq test_value
    end
  end

  describe "#resample" do
    let(:subject) { CSV.table 'spec/fixtures/resample_me.csv' }

    it "creates a similar table" do
      subject.resample 2..3, except: :year, seed: 232
      expect(subject.to_ascii).to match_fixture('resample_me.txt')
    end
  end

  describe "#round" do
    let(:subject) { CSV.table 'spec/fixtures/floats.csv' }

    it "rounds all values in a column to integer" do
      subject.round :value
      expect(subject[:value]).to eq [2,4,7]
    end

    it "rounds all values in a column to floats" do
      subject.round :value, decimals: 2
      expect(subject[:value]).to eq [2.12, 4.35, 6.57]
    end
  end

  describe "#save_as" do
    context "with a .csv extension" do
      let(:filename) { 'spec/tmp/test.csv' }

      it "saves a csv file" do
        File.delete filename if File.exist? filename
        expect(File).not_to exist filename
        expected = fixture 'basic.csv'
        
        subject.save_as filename

        expect(File.read filename).to eq expected
      end
    end

    context "with a .tsv extension" do
      let(:filename) { 'spec/tmp/test.tsv' }

      it "saves a tsv file" do
        File.delete filename if File.exist? filename
        expect(File).not_to exist filename
        
        subject.save_as filename

        expect(File.read filename).to match_fixture('basic.tsv')
      end
    end
  end

  describe "#show" do
    it "prints a pretty table" do
      expect{ subject.show }.to output_fixture('basic.txt')
    end
  end

  describe "#to_ascii" do
    it "converts to a pretty table", :focus do
      expect(subject.to_ascii).to match_fixture('basic.txt')
    end
  end

  describe "#to_tsv" do
    let(:result) { subject.to_tsv }

    it "returns tab delimited table rows" do
      expect(result).to match_fixture('basic.tsv')
    end
  end
end

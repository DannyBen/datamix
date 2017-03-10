require 'spec_helper'

using DataMix

describe Array do
  let(:subject) { [1,2,3,4] }

  describe "#*" do
    context "with a number" do
      it "multiplies array elements by the number" do
        expect(subject * 2).to eq [2,4,6,8]
      end
    end

    context "with another array" do
      it "multiplies array elements by the other array elements" do
        expect(subject * [3,2,3,2]).to eq [3,4,9,8]
      end      
    end
  end

  describe "#/" do
    context "with a number" do
      it "divides array elements by the number" do
        expect(subject / 2).to eq [0.5,1,1.5,2]
      end
    end

    context "with another array" do
      it "divides array elements by the other array elements" do
        expect(subject / [2,2,3,2]).to eq [0.5,1,1,2]
      end      
    end
  end

  describe "#+" do
    context "with a number" do
      it "adds the value to the array elements" do
        expect(subject + 2).to eq [3,4,5,6]
      end
    end

    context "with another array" do
      it "adds both array elements" do
        expect(subject + [1,2,3,4]).to eq [2,4,6,8]
      end      
    end
  end

  describe "#-" do
    context "with a number" do
      it "subtracts the value from the array elements" do
        expect(subject - 2).to eq [-1,0,1,2]
      end
    end

    context "with another array" do
      it "subtracts the values from the array elements" do
        expect(subject - [4,3,2,1]).to eq [-3,-1,1,3]
      end      
    end
  end

  describe "#offset" do
    context "with a positive number" do
      it "shifts the array forward" do
        expect(subject.offset 2).to eq [nil,nil,1,2]
      end
    end

    context "with a negative number" do
      it "shifts the array backwards" do
        expect(subject.offset -2).to eq [3,4,nil,nil]
      end
    end
  end

  describe "#prev" do
    context "without an argument" do
      it "behaves like #offset 1" do
        expect(subject.prev).to eq subject.offset(1)
      end
    end

    context "with an argument" do
      it "behaves like #offset N" do
        expect(subject.prev 2).to eq subject.offset(2)
      end
    end
  end

  describe "#next" do
    context "without an argument" do
      it "behaves like #offset -1" do
        expect(subject.next).to eq subject.offset(-1)
      end
    end

    context "with an argument" do
      it "behaves like #offset -N" do
        expect(subject.next 2).to eq subject.offset(-2)
      end
    end
  end


  describe "#round" do
    let(:subject) { [1.234, 2.345, 3.456, 4.567] }

    context "without an argument" do
      it "rounds all values to integer" do
        expect(subject.round).to eq [1,2,3,5]
      end
    end

    context "with an argument" do
      it "rounds all values to floats" do
        expect(subject.round 2).to eq [1.23, 2.35, 3.46, 4.57]
      end
    end
  end

  describe "#uniq?" do
    it "returns true if all elements are unique" do
      expect([1,2,3,4].uniq?).to be true
    end

    it "returns false if elements are not unique" do
      expect([1,2,3,1].uniq?).to be false
    end
  end

  describe "#window" do
    let(:subject) { [1,2,3,4,5,6,7,8,9,10] }

    it "yields the given block with a partial array" do
      index = 0
      subject.window(3) do |partial|
        expect(partial.size).to eq 3
        expect(partial.first).to eq subject[index]
        index += 1
      end
    end

    it "returns a full array" do
      result = subject.window(3) do |partial|
        partial.inject :+
      end

      expect(result).to eq [nil, nil, 6, 9, 12, 15, 18, 21, 24, 27]      
    end
  end
end

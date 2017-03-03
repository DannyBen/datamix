require 'spec_helper'

using DataMix

describe Object do
  describe "#file" do
    it "returns a CSV::Table" do
      expect(file 'spec/fixtures/basic.csv').to be_a CSV::Table
    end
  end
end

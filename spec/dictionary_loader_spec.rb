require 'dictionary_loader'
require 'dictionary'

describe DictionaryLoader do

  let(:dictionary) {Dictionary.new}

  describe ".load" do

    it "takes a filepath as a parameter" do
      expect{ DictionaryLoader.load("./5desk.txt") }.not_to raise_error
    end

    it "raises error if not given string argumnet" do
      expect{ DictionaryLoader.load(5) }.to raise_error(ArgumentError)
    end

    it "returns an instance of Dictionary" do
      expect(DictionaryLoader.load("./5desk.txt")).to be_a(Dictionary)
    end
  end

end

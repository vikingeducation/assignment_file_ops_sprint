require 'dictionary_loader'

describe DictionaryLoader do

  let(:dictionary) {Dictionary.new}

  describe ".load" do

    it "takes a filepath as a method" do
      expect{ DictionaryLoader.load("dict.txt") }.not_to raise_error(ArgumentError)
    end

    it "raises error if not given string argumnet" do
      expect{ DictionaryLoader.load(5) }.to raise_error(ArgumentError)

    end

  end

end

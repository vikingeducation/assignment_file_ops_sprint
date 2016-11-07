require 'rspec'
require 'dictionary_loader'

describe DictionaryLoader do

  let(:words) { %w{one two three}}

  let(:dictionary) { DictionaryLoader.load("dict_simple.txt") }

  let(:bad_dict) {DictionaryLoader.load("notreal.txt")}

  let(:simple_dict) {DictionaryLoader.load(words)}

  describe "#load" do
    it "takes a file as an argument" do
      expect{dictionary}.not_to raise_error
    end

    it "takes an array as an argument" do
      expect{simple_dict}.not_to raise_error
    end

    it "raises an ArgumentError if it does not receive a file or an array" do
      expect{bad_dict}.to raise_error(ArgumentError)
    end
  end

  describe "#load_dict" do

    it "it loads a given array into :words" do
      simple_dict
      expect(simple_dict).to eq(words)
    end

    it "loads a file into :words" do
      dictionary
      expect(dictionary).to eq(words)
    end
  end

end
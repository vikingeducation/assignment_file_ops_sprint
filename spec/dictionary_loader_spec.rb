require 'rspec' 
require 'dictionary_loader'
  
describe DictionaryLoader do

  let(:words) { %w{one two three}}

  let(:dictionary) { DictionaryLoader.new("dict_simple.txt") }

  let(:bad_dict) {DictionaryLoader.new("notreal.txt")}

  let(:simple_dict) {DictionaryLoader.new(words)}

  describe "#new" do
    it "takes a file as an argument" do
      expect{dictionary}.not_to raise_error
    end

    it "takes an array as an argument" do
      expect{simple_dict}.not_to raise_error
    end

    it "raises an ArgumentError if it does not receive a file or an array" do
      expect{bad_dict}.to raise_error(ArgumentError)
    end

    it "saves the file path to :file_path" do
      expect(dictionary.instance_variable_get(:@file_path)).to eq("dict_simple.txt")
    end

    it "calls #load_dict" do
      expect_any_instance_of(DictionaryLoader).to receive(:load_dict)
      dictionary
    end
  end

  describe "#load_dict" do

    it "it loads a given array into :words" do
      simple_dict
      expect(simple_dict.words).to eq(words)
    end

    it "loads a file into :words" do
      dictionary
      expect(dictionary.words).to eq(words)
    end
  end

end
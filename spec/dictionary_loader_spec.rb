# spec/dictionary_loader_spec.rb

require 'dictionary_loader'

describe "DictionaryLoader" do
  let(:dict_loader) { DictionaryLoader.new }

  describe "#initialize" do
    it "creates an instance of DictionaryLoader" do
      expect(dict_loader).to be_a(DictionaryLoader)
    end
  end

  describe "#load" do
    it "takes 1 argument" do
      expect(dict_loader).to respond_to(:load).with(1).argument
    end

    it "raises an error for any other number of arguments" do
      expect { dict_loader.load }.to raise_error(ArgumentError)
      expect { dict_loader.load("file1", "file2") }.to raise_error(ArgumentError)
    end

    it "raises an error if the file does not exist" do
      expect { dict_loader.load("blah.txt") }.to raise_error(/file does not exist/)
    end

    it "returns an instance of Dictionary"
  end
end
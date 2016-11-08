require 'rspec'
require 'dictionary'

describe Dictionary do

  let(:dict) { Dictionary.new("dict_simple.txt")}
  describe "#new" do
    it "starts with a default dictionary" do
      expect{dict}.not_to raise_error
      expect(dict.words).not_to be_nil
    end

    it "takes a file name or array as the first argument" do
      expect{Dictionary.new("dict_simple.txt")}.not_to raise_error
    end

    it "raises argument error if not passed file or array" do
      expect{Dictionary.new("dog")}.to raise_error(ArgumentError)
    end

    it "sets a search instance" do
      expect(dict.searcher).to be_a(DictionarySearcher)
    end

    it "creates an user interface instance" do
      expect(dict.ui).to be_a(DictionaryUI)
    end
  end
end 
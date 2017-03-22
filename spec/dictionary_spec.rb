# spec/dictionary_spec.rb

require 'dictionary'

describe "Dictionary" do
  let(:words) { ["aardvark", "bonobo", "cheetah"]}

  describe "#initialize" do
    it "sets @words to the provided argument" do
      dict = Dictionary.new(words)
      expect(dict.words).to eq(words)
    end
  end

  describe ".new" do
    it "takes one argument" do
      # this seems to always pass..?
      # expect(Dictionary).to respond_to(:new).with(1).argument

      expect { Dictionary.new(words) }.not_to raise_error
    end

    it "raises an error for any other number of arguments" do
      expect { Dictionary.new }.to raise_error(ArgumentError)
      expect { Dictionary.new(words, words) }.to raise_error(ArgumentError)
    end
  end

  context "instance variables" do
    it "does not allow @words to be modified after object instantiation"

    it "allows @words to be read"
  end

  describe "#word_count" do
    it "returns the number of words in the dictionary"
  end

  describe "#word_frequency" do
    it "returns the frequency of words in the dictionary by starting letter"
  end

  describe "#display_statistics" do
    it "prints the word count and word frequency to screen"
  end
end
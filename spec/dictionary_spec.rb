# spec/dictionary_spec.rb

require 'dictionary'

describe "Dictionary" do
  describe "#initialize" do
    it "sets @words to the provided argument"
  end

  describe ".new" do
    it "takes one argument"

    it "raises an error for any other number of arguments"
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
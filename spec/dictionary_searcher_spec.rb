# spec/dictionary_searcher_spec.rb

require 'dictionary_searcher'

describe "DictionarySearcher" do
  describe "#initialize" do
    it "creates an instance of DictionarySearcher"

    it "sets @dictionary to the provided argument"
  end

  describe ".new" do
    it "takes one argument"

    it "raises an error for any other number of arguments"
  end

  context "instance variables" do
    it "does not allow the dictionary to be modified after initialization"
      
    it "allows @dictionary to be read"
  end

  context "searching for words in the dictionary" do
    describe "#exact_matches" do
      it "returns the list of words that exactly match the search term"
    end

    describe "#partial_matches" do
      it "returns the list of words that partially match the search term"
    end

    describe "#begins_with_matches" do
      it "returns the list of words that begin with the search term"
    end

    describe "#ends_with_matches" do
      it "returns the list of words that end with the search term"
    end
  end

  context "displaying search results" do
    describe "#display_results" do
      it "displays the number of search results"

      it "displays the whole list of search results"
    end
  end
end
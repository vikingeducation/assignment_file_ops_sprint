# spec/dictionary_searcher_spec.rb

require 'dictionary_searcher'

describe "DictionarySearcher" do
  context "object instantiation" do
    describe ".new" do
      it "creates an instance of DictionarySearcher" do
        expect(DictionarySearcher.new).to be_a(DictionarySearcher)
      end

      it "takes one argument" do
        expect { DictionarySearcher.new("my argument") }.not_to raise_error
      end

      it "raises an error if more than one argument is provided" do
        expect { DictionarySearcher.new("argument 1", "argument 2") }.to raise_error(ArgumentError)
      end
    end

    describe "#initialize" do
      it "sets @dictionary to the provided argument" do
        string = "dictionary"
        expect(DictionarySearcher.new(string).dictionary).to eq(string)
      end
    end
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
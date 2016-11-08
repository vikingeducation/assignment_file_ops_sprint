require 'rspec'
require 'dictionary_searcher'

describe DictionarySearcher do

  let(:words) { %w{one two three word words scrum scrumptious}}

  let(:searcher) { DictionarySearcher.new(words)}

  describe "#new" do
    it "should take an array of words" do
      expect{searcher}.not_to raise_error
    end

    it "stores the words to the :words array" do
      expect(searcher.words).to eq(words)
    end
  end

  describe "#search" do
    it "accepts a string" do
      expect{searcher.find("three")}.not_to raise_error
    end

    it "returns an array of matches" do
      expect(searcher.find("wo")).to eq(["two", "word", "words"])
    end
  end

  describe "#starts_with" do
    it "accepts a string" do
      expect{searcher.starts_with("three")}.not_to raise_error
    end

    it "returns an array of matches" do
      expect(searcher.starts_with("wo")).to eq(["word", "words"])
    end
  end

  describe "#ends_with" do
    it "accepts a string" do
      expect{searcher.ends_with("three")}.not_to raise_error
    end

    it "returns an array of matches" do
      expect(searcher.ends_with("ds")).to eq(["words"])
    end
  end
end

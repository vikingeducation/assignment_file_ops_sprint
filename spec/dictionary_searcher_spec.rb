require 'dictionary_searcher'

describe DictionarySearcher do

  let(:dictionary) { instance_double("Dictionary",words: ["meow", "argh", "mama mia!"]) }
  let(:searcher) { DictionarySearcher.new(dictionary) }

  describe "#word_count" do 

    it "returns number of words in your dictionary as integer" do
      expect(searcher.word_count).to eq(3)
    end
  end

  describe "#word_frequency_by_letter" do
    it "returns the frequency words by starting letter" do
      freq_hash = searcher.word_frequency_by_letter
      expect(freq_hash["m"]).to eq(2)
    end
  end
end

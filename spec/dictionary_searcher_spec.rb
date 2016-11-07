describe DictionarySearch do

  describe "#word_count" do

    let(:dictionary) { instance_double(words: ["meow", "argh", "mama mia!"]) }
    let(:searcher) { DictionarySearcher.new(dictionary) }

    it "returns number of words in your dictionary as integer" do
      expect(searcher.word_count).to eq(3)
    end

  end

end
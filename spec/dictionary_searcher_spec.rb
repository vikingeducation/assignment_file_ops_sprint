require 'dictionary_searcher'

describe DictionarySearcher do

  let(:dictionary) { instance_double('dictionary', :word_bank => ['one', 'two']) }
  let(:searcher) { DictionarySearcher.new(dictionary) }
  describe '#exact_matches' do
    it 'returns exact matches to the query' do
      expect(searcher.exact_matches('one')).to eq(['one'])
    end
  end

  describe '#partial_matches' do
    it 'returns partial matches to the query' do
      expect(searcher.partial_matches("ne")).to eq(['one'])
    end
  end

  describe '#begins_with_matches' do
    it 'returns matches that begin with the query' do
      expect(searcher.begins_with_matches('tw')).to eq(['two'])
    end
  end

  describe '#ends_with_matches' do
    it 'returns matches that end with the query' do
      expect(searcher.ends_with_matches("wo")).to eq(["two"])
    end
  end
end

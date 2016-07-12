require 'dictionary_searcher'

describe DictionarySearcher do

  let(:dictionary) { instance_double('dictionary', :word_bank => ['one', 'two']) }
  let(:searcher) { DictionarySearcher.new(dictionary) }
  describe '#exact_matches' do
    it 'returns exact matches to the query' do
      expect(searcher.exact_matches('one')).to eq(['one'])
    end
  end
end

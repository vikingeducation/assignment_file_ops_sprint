RSpec.describe DictionarySearcher do
  let(:dictionary) do
    words = %w(bumblebee bummer cat Fahrenheit sameness)
    Dictionary.new(words)
  end

  let(:searcher) { DictionarySearcher.new(dictionary) }

  describe 'exact match' do
    it 'returns only words exactly matching search term' do
      term = 'Cat'
      expect(searcher.exact_match(term)).to eq %w(cat)
    end
  end

  describe 'partial match' do
    it 'returns only words including search term' do
      term = 'me'
      expect(searcher.partial_match(term)).to eq %w(bummer sameness)
    end
  end

  describe '"begins with" match' do
    it 'returns only words starting with the search term' do
      term = 'bum'
      expect(searcher.begins_with_match(term)).to eq %w(bumblebee bummer)
    end
  end

  describe '"ends with" match' do
    it 'returns only words ending with search term' do
      term = 'heit'
      expect(searcher.ends_with_match(term)).to eq %w(Fahrenheit)
    end
  end
end
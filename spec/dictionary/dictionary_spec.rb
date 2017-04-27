RSpec.describe Dictionary do
  describe 'providing dictionary statistics' do
    describe 'word count' do
      it 'returns the number of words' do
        words = %w(abacus abandon abasement)
        dictionary = Dictionary.new(words)
        expect(dictionary.stats[:word_count]).to eq 3
      end
    end

    describe 'starting letter word frequency' do
      it 'returns the number of words starting with each letter' do
        words = %w(abacus abandon abasement baboon Bacchus cat)
        dictionary = Dictionary.new(words)

        expect(dictionary.stats[:word_frequency][:a]).to eq 3
        expect(dictionary.stats[:word_frequency][:b]).to eq 2
        expect(dictionary.stats[:word_frequency][:c]).to eq 1
      end
    end
  end
end
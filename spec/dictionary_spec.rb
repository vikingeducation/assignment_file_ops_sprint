require 'dictionary'

describe Dictionary do

  let(:dictionary) { Dictionary.new(["one", "two"])}

  describe '#initialize' do
    it 'sets up a word bank' do
      expect(dictionary.word_bank).to eq(["one", "two"])
    end
  end

  describe '#stats' do

    it 'calls word_count' do
      expect(dictionary).to receive(:word_count)
      dictionary.stats
    end

    it 'calls words_by_starting_letter' do
      expect(dictionary).to receive(:words_by_starting_letter)
      dictionary.stats
    end

    it 'returns a hash with correct frequencies and count' do
      expect(dictionary.stats).to eq({word_count: 2, words_by_starting_letter: {'o'=> 1, 't' => 1}})
    end
  end
end

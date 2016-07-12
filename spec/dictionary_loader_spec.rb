require 'dictionary_loader'
require 'dictionary'

describe DictionaryLoader do
  describe '#load' do
    it 'returns a dictionary' do
      expect(subject.load('5desk.txt')).to be_a(Dictionary)
    end
  end
end

require 'dictionary'

describe 'DictionarySpec' do
  before { allow(STDOUT).to receive(:puts).and_return nil}
  let(:e){ ['ant', 'eater']}
  let(:d){ Dictionary.new(e)}

  describe '#initialize' do

    it 'accepts and stores dictionary entries' do
      expect(d.entries).not_to be nil
    end

    it 'creates a hash' do
      expect(d.instance_variable_get(:@words)).to be_a(Hash)
    end

    it 'should calculate the word frequency' do
      expect_any_instance_of(Dictionary).to receive(:calculate_word_frequency)
      d
    end

    it 'should print dictionary stats' do
      expect_any_instance_of(Dictionary).to receive(:print_stats)
      d
    end
  end

end

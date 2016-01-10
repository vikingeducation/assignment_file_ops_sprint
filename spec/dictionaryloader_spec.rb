require 'dictionaryloader'

describe DictionaryLoader do

  let(:dl){DictionaryLoader.new}

  it 'should be an instance of class' do
    expect(subject).to be_a(DictionaryLoader)
  end

  describe '#load_file' do
    # The issue is, I'm thinking black box as in test input and output but I feel like that makes testing a bit hard.
    it 'raises an error if argument is not a valid file location' do
      expect{dl.load_file("X")}.to raise_error
    end

    it 'does not raise an error if argument is a valid file location' do
      expect{dl.load_file("5desk.txt")}.not_to raise_error
    end
  end

  describe '#chomp_words' do
    it 'raises an error if argument is not an array' do
      expect{dl.chomp_words("X")}.to raise_error
    end

    it 'does not raise an error if argument is an array' do
      expect{dl.chomp_words(["DX", "GD"])}.not_to raise_error
    end

    it 'strips items in the array(argument) of spaces and then puts them into the @dictionary.array' do
      # I need to get the array from the @dictionary created by dl...
      dictionary = dl.instance_variable_get(:@dictionary)
      dl.chomp_words(["X\n", "Y\n"])
      expect(dictionary.array).to eq(['X', 'Y'])
    end
  end
end
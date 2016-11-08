# Dictionary is the class which wraps the loaded dictionary.

class Dictionary

  attr_accessor :file, :frequency_hash, :searcher

  def initialize(file)
    @file = file
    @searcher = DictionarySearcher.new(@file)
  end

  def letter_frequency
    alphabet_hash = generate_alphabet_hash
    @file.each do |word|
      first_letter = word[0].downcase
      alphabet_hash[first_letter] += 1
    end
    alphabet_hash
  end

  def generate_alphabet_hash
    alphabet_hash = {}
    letter_array = ('a'..'z').to_a
    letter_array.each do |letter|
      alphabet_hash[letter] = 0
    end
    alphabet_hash
  end

  def search_match(choice, search_term)
    @searcher.which_match(choice, search_term)
  end

end
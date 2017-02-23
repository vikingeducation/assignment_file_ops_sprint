# Dictionary is the class which wraps the loaded dictionary.

class Dictionary

  attr_accessor :file, :words

  def initialize(file)
    @file = DictionaryLoader.new(file)
  end

  def word_count
    @file.size
  end

  def words_count_by_first_letter
    words_frequency = {}
    alphabet = "ABCDEFGHIJKLMNOPQRSTWXYZ".split("")
    alphabet.each do |letter|
      counter = 0
      @file.each {|word| counter += 1 if word[0] == letter }
      words_frequency[letter] = counter
    end
    words_frequency
  end

  def display_words_by_numbers
    words_count_by_first_letter.each{|key, value| puts "#{key}: #{value}"}
  end

end

end


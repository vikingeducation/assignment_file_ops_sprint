# Dictionary is the class which wraps the loaded dictionary.

class Dictionary

  attr_accessor :file, :words

  def initialize(arr)
    @file = DictionaryLoader.new(arr)
  end

  def word_count
    @file.size
  end

  def first_letter_count
    # words_frequency = {}
    letter_freq = Hash.new
    # alphabet = "ABCDEFGHIJKLMNOPQRSTWXYZ".split("")
    alphabet.each do |letter|
      counter = 0
      @file.each {|word| counter += 1 if word[0] == letter }
      letter_freq[letter] = counter


    # If the hash key is already present append to it or add it as a new key
    if(letter_freq.key?(word[0).upcase)
      letter_freq[word[0).upcase] += [(word[0).upcase]
    else
      # Add a new key to the hash - words are stored in an array
      letter_freq[word[0).upcase = 1
    end
  end
    end
    words_frequency
  end



end


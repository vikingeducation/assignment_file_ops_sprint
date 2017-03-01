# Dictionary is the class which wraps the loaded dictionary.

class Dictionary

  attr_accessor :words

  def initialize(arr)
    @words = arr
  end

  def num_words
    @words.size
  end

  def first_letter_count
    letter_freq = Hash.new
    @words.each do |word|
      # If the hash key is already present append to it or add it as a new key
      if(letter_freq.key?(word[0].upcase))
        letter_freq[word[0].upcase] += 1
      else
        # Add a new key to the hash 
        letter_freq[word[0].upcase] = 1
      end
    end

    letter_freq
  end

  def output_letter_freq(letter_count)
    letter_count.each do |x, y|
      puts "#{x}: #{y}"
    end
  end
end


class Dictionary
  attr_reader :words

  def initialize
    @words = []
    @letter_frequency = Hash.new { |h,k| h[k] = 0 }
  end

  def add_word(word)
    @letter_frequency[word[0].upcase] += 1
    @words << word
  end

  def size
    @words.size
  end

  def display_letter_frequencies
    @letter_frequency.each do |letter, frequency|
      puts "#{letter}: #{frequency}"
    end
  end
end

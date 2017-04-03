class Dictionary
  attr_reader :words

  def initialize(words)
    @words
  end

  def word_count
    @words.length
  end

  def word_frequency
    @occurrences = {}
    @words.each do |word|
      first_letter = word[0].downcase
      @occurrences[first_letter.downcase] += 1
    end
  end
end

class Directory
  attr_reader :words
  def initialize(words)
    @words = words
  end

  def size
    words.size
  end

  def word_frequency
    frequency_hash = {}

    words.each do |word|
      # word = word[0].upcase
      frequency_hash[word[0]] ||= 0
      frequency_hash[word[0]] += 1
    end

    frequency_hash
  end
end

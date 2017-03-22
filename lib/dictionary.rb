class Dictionary
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def word_count
    self.words.length
  end

  def word_frequency
    # { "a": 1, "b": 1, "c": 1 }
    frequency = {}
    ('a'..'z').each do |char|
      frequency[char] = 0
    end

    self.words.each do |word|
      key = word.downcase[0]
      frequency[key] += 1 if frequency.has_key?(key)
    end

    frequency
  end
end
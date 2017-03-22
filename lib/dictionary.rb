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

  def to_s
    output = ""
    output += "Dictionary successfully loaded.\n"
    output += "Your dictionary contains #{self.word_count} words.\n"

    output += "Word frequency by starting letter:\n"

    word_frequency = self.word_frequency
    word_frequency.keys.each do |key|
      output += "#{key}: #{word_frequency[key]}\n"
    end

    output
  end
end
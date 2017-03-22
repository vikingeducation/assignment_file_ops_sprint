class Dictionary
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def word_count
    self.words.length
  end
end
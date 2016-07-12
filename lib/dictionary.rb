# holds a list of words
class Dictionary
  attr_reader :words

  def initialize(words = [])
    @words = words
  end

  def word_count
    @words.length
  end
end
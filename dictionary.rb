

class Dictionary

  attr_reader :words

  def initialize(word_array)
    @words = word_array
    @word_count = Hash.new(0)
  end

  def total_words
    @words.size
  end

  def word_count
    if @word_count.empty?
      @words.each do |word|
        @word_count[word[0].downcase] += 1
      end
    end
    @word_count
  end

end
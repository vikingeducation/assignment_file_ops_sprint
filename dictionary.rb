

class Dictionary

  attr_reader :total_words

  def initialize(word_array)
    @dictionary = word_array
    @word_count = Hash.new(0)
    @total_words = @dictionary.size
  end

  def each
    @dictionary.each do |word|
      yield word
    end
    @dictionary
  end

  def word_count
    if @word_count.empty?
      @dictionary.each do |word|
        @word_count[word[0].downcase] += 1
      end
    end
    @word_count
  end

end
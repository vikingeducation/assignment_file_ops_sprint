class DictionaryAnalyzer
  attr_accessor :words

  def initialize(words)
    @words = words
  end

  def word_count
    words.size
  end

  def each_letter_word_count
    alphabet = [*("a".."z")]
    count = []

    alphabet.each do |letter|
      num = 0

      words.each do |line|
        num += 1 if line.strip[0] == letter
      end
      count << num
    end

    word_count = Hash[alphabet.zip(count)]
  end
end
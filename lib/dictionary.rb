class Dictionary

  attr_reader :words

  def initialize(file)
    @file = file
    @words = []
    @letter_freq = Hash.new(0)
    get_words
  end

  def get_words
    IO.foreach(@file) do |line|
      @words << line.strip.downcase
    end
    @file.close
  end

  def word_count
    @words.length
  end

  def freq_start_letters
    @words.each do |word|
      first_letter = word[0]
      @letter_freq[first_letter] += 1
    end
    @letter_freq
  end

end

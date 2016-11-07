class Dictionary

  attr_reader :words

  def initialize(file)
    @file = file
    @words = []
    @letter_freq = {}
    get_words
  end

  def get_words 
    IO.foreach(@file) do |line|
      @words << line.strip
    end
  end

  def word_count
    @words.length
  end

  def freq_start_letters
    @words.each do |word|
      first_let = word[0].downcase
      if @letter_freq.has_key?(first_let)
        @letter_freq[first_let] += 1
      else
        @letter_freq[first_let] = 1
      end
    end
  end

end


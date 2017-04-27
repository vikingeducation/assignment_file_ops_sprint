class Dictionary
  attr_reader :index, :all_words

  def initialize(words)
    @all_words = clean_words(words)
    @index = index_words
  end

  def stats
    {
      word_count: word_count,
      word_frequency: word_frequency
    }
  end

  private

  def clean_words(words)
    words.map &:chomp
  end

  def index_words
    alphabet_syms = (:a..:z).to_a
    alphabet_syms.each_with_object({}) do |letter, index|
      index[letter] = @all_words.select { |word| word.downcase =~ /^#{letter}/ }
    end
  end

  def word_count
    @count ||= @index.values.flatten.size
  end

  def word_frequency
    frequencies = {}
    @index.each do |letter, words|
      frequencies[letter] = words.size
    end

    frequencies
  end
end

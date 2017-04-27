class Dictionary
  attr_reader :index, :all_words

  def initialize(words)
    @all_words = words
    @index = index_words(words)
  end

  def stats
    {
      word_count: word_count,
      word_frequency: word_frequency
    }
  end

  private

  def index_words(words)
    alphabet_syms = (:a..:z).to_a
    alphabet_syms.each_with_object({}) do |letter, index|
      index[letter] = words.select { |word| word.downcase =~ /^#{letter}/ }
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

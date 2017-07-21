class DictionarySearcher
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def search_exact(term)
    @dictionary.words.select { |word| word.downcase == term.downcase }
  end

  def search_partial(term)
    @dictionary.words.select { |word| word.downcase.include? term.downcase }
  end

  def search_start_with(term)
    @dictionary.words.select { |word| word.downcase.start_with? term.downcase }
  end

  def search_end_with(term)
    @dictionary.words.select { |word| word.downcase.end_with? term.downcase }
  end
end

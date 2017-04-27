class DictionarySearcher
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def begins_with_match(term)
    candidates_from_index(term).select { |word| word =~ /^#{term}/ }
  end

  def ends_with_match(term)
    candidates_from_all.select { |word| word =~ /#{term}$/ }
  end

  def exact_match(term)
    candidates_from_index(term).select { |word| word.downcase == term.downcase }
  end

  def partial_match(term)
    candidates_from_all.select { |word| word =~ /#{term}/ }
  end

  private

  attr_reader :dictionary

  def candidates_from_all
    dictionary.all_words
  end

  def candidates_from_index(term)
    dictionary.index[search_key(term)]
  end

  def search_key(term)
    term.chr.downcase.to_sym
  end
end

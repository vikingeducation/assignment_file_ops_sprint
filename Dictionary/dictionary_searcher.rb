class DictionarySearcher 
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def search_exact(term)
    @dictionary.select { |word| word.chomp == term }
  end

  def search_partial(term)
    @dictionary.select { |word| word.chomp.include?(term) } 
  end

  def search_begins_with(term)
    @dictionary.select { |word| word.chomp[0..(term.length - 1)] == term }
  end

  def search_ends_with(term)
    @dictionary.select { |word| word.chomp[-term.length..-1] == term }
  end
end
class DictionarySearcher

  def initialize dictionary
    @dictionary = dictionary
  end

  def self.search(search_kind, term)
    case search_kind
    when 1
      search_exact(term)
    when 2
      search_partial(term)
    when 3
      search_begins_with(term)
    when 4
      search_ends_with(term)
    end
  end

  def search_exact(query)
    
  end

  def search_partial(query)

  end

  def search_begins_with(query)

  end

  def search_ends_with(query)

  end

end

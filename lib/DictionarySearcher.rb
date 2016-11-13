class DictionarySearcher

  def initialize dictionary
    @dictionary = dictionary
  end

  def search_exact(query)
    results = []
    @dictionary.words.each do |word|
      if word == query
        results << word
      end
    end
    results
  end

  def search_partial(query)
    results = []
    @dictionary.words.each do |word|
      if word.match(/#{query}/)
        results << word
      end
    end
    results
  end

  def search_begins_with(query)
    results = []
    @dictionary.words.each do |word|
      if word.match(/^#{query}/)
        results << word
      end
    end
    results
  end

  def search_ends_with(query)
    results = []
    @dictionary.words.each do |word|
      if word.match(/#{query}\z/)
        results << word
      end
    end
    results
  end

  def show_results(results)
    puts "Found #{results.length} matches:"
    results.each { |word| puts word.upcase }
  end

  def search(search_kind, term)
    results = []
    case search_kind
    when 1
      results = search_exact(term)
    when 2
      results = search_partial(term)
    when 3
      results = search_begins_with(term)
    when 4
      results = search_ends_with(term)
    end
    show_results(results)
    results

  end

end

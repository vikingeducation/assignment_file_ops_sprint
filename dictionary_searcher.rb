class DictionarySearcher

  def search dictionary
    search_type = search_kind
    puts "Enter the Search Term :"
    search_term = gets.chomp.upcase

    case search_type
    when 1
      exact(dictionary, search_term)
    when 2
      partial(dictionary, search_term)
    when 3
      begins_with(dictionary, search_term)
    when 4
      ends_with(dictionary, search_term)
    end
  end

  def search_kind
    loop do
      puts "What kind of Search ?
      1: Exact
      2: Partial
      3: Begins_With
      4: Ends_With
      "
      search_type = gets.chomp.to_i
      return search_type if (1..4).include?(search_type)
    end
  end

  def exact(dictionary, search_term)
    result = dictionary.select do |word|
      word.match(/^#{search_term}$/)
    end
  end

  def partial(dictionary, search_term)
    result = dictionary.select do |word|
      word.match(search_term)
    end
  end

  def begins_with(dictionary, search_term)
    result = dictionary.select do |word|
      word[0...search_term.length] == search_term
    end
  end

  def ends_with(dictionary, search_term)
    result = dictionary.select do |word|
      word.match(/#{search_term}$/)
    end
  end


end
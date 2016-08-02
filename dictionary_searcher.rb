class DictionarySearcher
  def search dictionary, choice
    puts "Enter the search term"
    search_term = gets.chomp
    case choice
    when 1
      return exact_search search_term, dictionary
    when 2
      return partial_search search_term, dictionary
    when 3
      return begin_search search_term, dictionary
    when 4
      return end_search search_term, dictionary
    else
      puts "wrong choice!"
    end
  end

  def search_choice
    loop do
      puts "What kind of search?"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins with"
      puts "4: Ends with"
      choice = gets.chomp
      return 1 if choice == '1'
      return 2 if choice == '2'
      return 3 if choice == '3'
      return 4 if choice == '4'
      return 'q' if choice.downcase == 'q'
    end
  end

  def exact_search search_term, dictionary
    results = dictionary.select do |word|
      /^#{search_term.upcase}$/ =~ word.upcase
    end
    puts "Found #{results.length} matches"
    results.each do |word|
      puts word
    end
    results
  end

  def partial_search search_term, dictionary
    results = dictionary.select do |word|
      /#{search_term.upcase}/ =~ word.upcase
    end
    puts "Found #{results.length} matches"
    results.each do |word|
      puts word
    end
    results
  end

  def begin_search search_term, dictionary
    results = dictionary.select do |word|
      /^#{search_term.upcase}/ =~ word.upcase
    end
    puts "Found #{results.length} matches"
    results.each do |word|
      puts word
    end
    results
  end

  def end_search search_term, dictionary
    results = dictionary.select do |word|
      /#{search_term.upcase}$/ =~ word.upcase
    end
    puts "Found #{results.length} matches"
    results.each do |word|
      puts word
    end
    results
  end

end

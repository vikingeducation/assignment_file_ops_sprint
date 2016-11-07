class DictionaryUI

  def initialize

  end

  def run
    loop do
      get_dictionary
      results = get_search
      save(results)
    end
  end

  def get_dictionary
    puts "What is the path to your dictionary?"
    path = gets.chomp
    @dictionary = DictionaryLoader.load(path)
    @searcher = DictionarySearcher.new(@dictionary)
    puts "Dictionary successfully loaded."
    print_statistics
  end

  def get_search
    puts "What kind of search?"
    puts "1: Exact", "2: Partial", "3: Begins with", "4: Ends with"
    mode = gets.chomp
    puts "Enter the search term:"
    term = gets.chomp
    # get contents
    results = @searcher.search(mode, term)
    print_results(results)
    results
    # check fo rq
  end

  def save(results)
    save_to_file(results) if ask_save
  end

  def ask_save
    puts "Do you want to save your results? (y/n)? 'q' quits"
    decision = gets.chomp.downcase
    decision == 'y' ? true : false
  end

  def save_to_file(results)
    
  end

  def print_statistics
    puts "Your dictionary contains: #{@dictionary.entry_count} words."
    puts "Words frequency by starting letter:"
    @dictionary.words_by_letter.each do |letter, count|
      puts "#{letter}: #{count}"
    end
  end

  def print_results(results)
    puts "Found #{results.length} results"
    results.each { |result| puts result }
  end
end
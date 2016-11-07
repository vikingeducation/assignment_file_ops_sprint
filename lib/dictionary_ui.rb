class DictionaryUI

  def initialize

  end

  def run
    get_dictionary
    loop do
      results = search
      save(results)
    end
  end

  def get_dictionary
    puts "What is the path to your dictionary?"
    path = gets.chomp
    path = File.expand_path(File.dirname(__FILE__)) + "/../#{path}"
    @dictionary = DictionaryLoader.load(path)
    @searcher = DictionarySearcher.new(@dictionary)
    puts "Dictionary successfully loaded."
    print_statistics
  end

  def search
    puts "What kind of search?"
    puts "1: Exact", "2: Partial", "3: Begins with", "4: Ends with"
    mode = get_mode
    puts "Enter the search term:"
    term = gets.chomp
    results = @searcher.search(mode, term)
    print_results(results)
    results
  end

  def get_mode
    mode = gets.chomp
    if !(1..4).include?(mode.to_i)
      puts "Please enter an integer from 1 to 4"
      get_mode
    end
  end

  def save(results)
    ResultsSaver.new(results).save if ask_save
  end

  def ask_save
    puts "Do you want to save your results? (y/n)? 'q' quits"
    decision = gets.chomp.downcase
    exit if decision == 'q'
    decision == 'y'  
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
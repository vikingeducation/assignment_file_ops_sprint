require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI
  attr_accessor :path

  def initialize
    @path = nil
    @search_choice = nil
    @search_term = nil
    @save_response = nil
  end

  def run
    get_path
    load_dictionary
    display_load_msg
    match_type
    search_term
    results = get_match_type(@search_choice, @search_term)
    display_results(results)
    save_file
    return if %w(n q).include?(@save_response)
    results_saver = ResultsSaver.new(results)
    results_saver.get_filepath
    results_saver.write_file
  end

  def get_path
    puts 'Where is your dictionary? (\'q\' to quit)'
    @path = gets.chomp
  end

  def load_dictionary
    @dictionary_file = DictionaryLoader.load_dict(@path)
    @dictionary = Dictionary.new(@dictionary_file)
    @searcher = DictionarySearcher.new(@dictionary.words)
  end

  def display_load_msg
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{@dictionary.word_count} words."
    puts "Word frequency by starting letter:"
    @dictionary.freq_start_letters.each do |letter, count|
      puts "#{letter.upcase}: #{count}"
    end
    puts
  end

  def match_type
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
    loop do
      @search_choice = gets.chomp
      break if valid_input?(@search_choice)
    end
  end

  def valid_input?(input)
    %w(1 2 3 4).include? input
  end

  def search_term
    print "Enter the search term: "
    loop do
      @search_term = gets.chomp.downcase
      break if @search_term.is_a?(String)
    end
  end

  def get_match_type(choice, term)
    case choice
    when "1"
      @searcher.exact_matches(term)
    when "2"
      @searcher.partial_matches(term)
    when "3"
      @searcher.begins_with(term)
    when "4"
      @searcher.ends_with(term)
    else
      raise "Error - invalid choice"
    end
  end

  def display_results(results)
    puts "Found #{results.size} matches:"
    puts results
  end

  def save_file
    puts "Do you want to save results (y/n)? \'q\' quits."
    loop do
      @save_response = gets.chomp.downcase
      break if %w(y n q).include?(@save_response)
    end
  end

end

# run code

t = DictionaryUI.new
t.run
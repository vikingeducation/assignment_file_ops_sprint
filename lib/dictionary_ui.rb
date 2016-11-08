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
  end

  def run
    puts 'Where is your dictionary? (\'q\' to quit)'
    get_path
    load_message
    get_match_prompt
    loop do
      @search_choice = gets.chomp
      break if valid_input?(@search_choice)
    end
    search_term_prompt
    loop do
      @search_term = gets.chomp.downcase
      break if @search_term.is_a?(String)
    end
    results = get_match_type(@search_choice, @search_term)
    display_results(results)
    save_prompt
    loop do
      save_response = gets.chomp.downcase
      break if @search_term.is_a?(String)
    end   
  end

  def get_path
    @path = gets.chomp
  end

  def load_dictionary
    @dictionary_file = DictionaryLoader.load_dict(@path)
    @dictionary = Dictionary.new(@dictionary_file)
    @searcher = DictionarySearcher.new(@dictionary.words)
  end

  def load_message
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{@dictionary.word_count} words."
    puts "Word frequency by starting letter:"
    @dictionary.freq_start_letters.each do |letter, count|
      puts "#{letter.upcase}: #{count}"
    end
    puts
  end

  def match_prompt
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
  end

  def valid_input?(input)
    %w(1 2 3 4).include? input
  end

  def search_term_prompt
    print "Enter the search term: "
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

  def save_prompt
    puts "Do you want to save results (y/n)? \'q\' quits."
  end

end

t = DictionaryUI.new

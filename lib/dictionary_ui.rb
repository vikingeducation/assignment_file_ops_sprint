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
    run
  end

  def run
    puts 'Where is your dictionary? (\'q\' to quit)'
    get_path
    load_dictionary
    load_message
    search_loop
  end

  def search_loop
    match_prompt
    search_term_prompt
    results = get_match_type(@search_choice, @search_term)
    display_results(results)
    save_prompt
    search_again
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
    @search_choice = valid_input(gets.chomp, %w(1 2 3 4))
  end

  def valid_input(input, acceptable_values)
    if input == 'q'
      exit
    elsif acceptable_values.include? input
      input
    else
      puts "Please enter a valid selection!"
      valid_input(gets.chomp, acceptable_values)
    end
  end

  def search_term_prompt
    print "Enter the search term: "
    @search_term = gets.chomp.downcase
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
    @save_response = valid_input(gets.chomp.downcase, %w(y n q))
  end

  def search_again
    if @save_response == 'q'
      exit
    elsif @save_response == 'y'
      save = ResultsSaver.new(results)
    else
      search_loop
    end
  end
end

t = DictionaryUI.new

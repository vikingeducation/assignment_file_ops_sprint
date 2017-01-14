# main class that handles user interaction
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  def run
    load_dictionary
    set_up_search
    perform_search
    print_search_results
    save_to_file if save_file?
    say_goodbye
  end

  def load_dictionary
    get_path until valid_path?
    @dictionary = DictionaryLoader.load(@file_path)
  end

  def save_to_file
    get_save_path until safe_to_save?
    save
  end

  def safe_to_save?
    return false unless @save_path
    if File.exists?(@save_path)
      return overwrite_file?
    end
    true
  end

  def overwrite_file?
    loop do
      puts "That file already exists. Shall we overwrite it? y/n? 'q' quits"
      @overwrite = gets.strip
      check_quit(@save)
      return true if @overwrite == 'y'
      return false if @overwrite == 'n'
    end
  end


  def say_goodbye
    puts 'Goodbye.'
  end

  def save_file?
    return false unless @search_results
    loop do
      puts "Would you like to save the results? y/n? 'q' quits"
      @save = gets.strip
      check_quit(@save)
      return true if @save == 'y'
      return false if @save == 'n'
    end
  end


  def save
    ResultsSaver.save(@save_path, @search_results)
    puts "File successfully saved!"
    puts
  end

  def get_save_path
    puts "What filepath should we write the results to?"
    @save_path = gets.strip
    check_quit(@save_path)
  end

  def ask(message)
    puts message
    loop do
      input = gets.strip
      check_quit(input)
      return true if input == 'y'
      return false if input == 'n'
      puts "Please enter 'y', 'n' or 'q'"
    end
  end

  def print_search_results
    if @search_results
      puts "Found #{@search_results.size} matches:"
      @search_results.each do |word|
        puts word.upcase
      end
    else
      puts "Found 0 matches."
    end
    puts "***"
  end

  def perform_search
    @search_results = case
    when @search_type == 1 then @searcher.exact
    when @search_type == 2 then @searcher.partial
    when @search_type == 3 then @searcher.begins_with
    when @search_type == 4 then @searcher.ends_with
    end
  end

  def set_up_search
    @searcher = DictionarySearcher.new(@dictionary)
    ask_for_search_type until valid_search_type?
    get_search_term until valid_search_term?
    @searcher.term = @search_term
  end

  def valid_search_term?
    letters = ("a".."z").to_a
    return false unless @search_term
    return false if @search_term.split('').any?{ |l| !letters.include?(l) }
    true
  end

  def get_search_term
    puts
    puts 'Enter your search term'
    puts '(No spaces or digits allowed)'
    @search_term = gets.strip.downcase
    puts
  end

  def ask_for_search_type
    puts "What kind of search would you like to perform?"
    puts "1. Exact"
    puts "2. Partial"
    puts "3. Begins with"
    puts "4. Ends with"
    @search_type = gets.strip
  end

  def valid_search_type?
    check_quit(@search_type)
    @search_type = @search_type.to_i
    return false unless @search_type.between?(1,4)
    true
  end

  def valid_path?
    return false unless @file_path
    unless File.exists?(@file_path)
      puts "Dictionary not found! Please check the path and file name"
      return false
    end
    true
  end

  def get_path
    puts "Where is your dictionary? ('q' to quit)"
    @file_path = gets.strip
    check_quit(@file_path)
  end

  def check_quit(input)
    if input == 'q' || input == 'quit' || input == 'exit'
      puts "Goodbye"
      exit
    end
  end
end

d = DictionaryUI.new
d.run

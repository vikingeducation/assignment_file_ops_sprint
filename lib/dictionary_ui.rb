# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'result_saver'

class DictionaryUI

  def initialize
    @dictionary = Dictionary.new
    @dictionary_loader = DictionaryLoader.new(@dictionary)
    @dictionary_searcher = DictionarySearcher.new(@dictionary)
    @file_location = nil
    @result_saver = ResultSaver.new
    @write_mode = 'a+'
  end

  def run
    print "Where is your dictionary? ('q' to quit): "
    response = gets.chomp
    exit if quit?(response)
    @dictionary_loader.load_file(response)
    search
    puts ""
  end

private

  def prompt_to_save(word, search_type)
    print "Save Results? (y, n or q): "
    response = gets.chomp
    exit if quit?(response)
    # I want to save
    # the initial word that was searched for,
    # the type of search that was done,
    # the number of matches and
    # the words that matched.####
    @result_saver.save_results(word, search_type, @dictionary_searcher.matches, get_file_name, @write_mode) if response == 'y'
  end

  def get_file_name
    @write_mode = 'a+'
    print "Name of file to save to?: "
    response = gets.chomp
    exit if quit?(response)
    get_write_mode if File.file?(response)
    response
  end

  # the write_mode seems crucial either way, because even if not specified by the user, it'll have to default to something.
  def get_write_mode
    # by default it'll be create a new file and write/read.
    print "File already exists, overwrite existing file? (y, n or q): "
    response = gets.chomp
    exit if quit?(response)
    @write_mode = 'w+' if response == 'y'
  end

  def quit?(response)
    response == 'q'
  end

  def search
    puts ""
    puts ""
    puts "Search Your Dictionary"
    puts "1: Exact Matches"
    puts "2: Partial Matches"
    puts "3: Begins With Matches"
    puts "4: Ends With Matches"
    puts ""
    print "What Word or Part of a Word do you want yo search for('q' to quit): "
    word = gets.chomp
    exit if quit?(word)
    print "And Which Option? (1,2,3,4 or 'q' to quit): "
    assign_search(word, get_valid_search_number)
  end

  def assign_search(word, search_type)
    if search_type == "1"
      @dictionary_searcher.exact_match(word)
    elsif search_type == '2'
      @dictionary_searcher.partial_match(word)
    elsif search_type == '3'
      @dictionary_searcher.begins_with(word)
    else
      @dictionary_searcher.ends_with(word)
    end
    prompt_to_save(word, search_type)
  end

  def get_valid_search_number
    search_type = gets.chomp
    until ("1".."4").include? search_type
      exit if quit?(search_type)
      puts "Invalid response"
      puts ""
      puts "Search Your Dictionary"
      puts "1: Exact Matches"
      puts "2: Partial Matches"
      puts "3: Begins With Matches"
      puts "4: Ends With Matches"
      puts ""
      print "Type 1,2,3,4 or 'q' to quit: "
      search_type = gets.chomp
    end
    search_type
  end
end

DictionaryUI.new.run
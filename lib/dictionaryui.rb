# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'dictionaryloader'
require_relative 'dictionary'
require_relative 'dictionarysearcher'

class DictionaryUI

  def initialize
    @dictionary = Dictionary.new
    @dictionary_loader = DictionaryLoader.new(@dictionary)
    @dictionary_searcher = DictionarySearcher.new(@dictionary)
    @file_location = nil
  end

  def run
    print "Where is your dictionary? ('q' to quit): "
    response = gets.chomp
    exit if quit?(response)
    @dictionary_loader.load_file(response)
    search
  end

  private

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
  end

  def get_valid_search_number
    search_type = gets.chomp
    until ("1".."4").include? search_type
      exit if quit?(serach_type)
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
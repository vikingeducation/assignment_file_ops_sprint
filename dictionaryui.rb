require_relative 'dictionary_loader.rb'
require_relative 'dictionary.rb'
require_relative 'dictionary_searcher.rb'

class DictionaryUI

  def initialize
    @file_name = nil
    @dictionary = nil
    @kind_of_search = 0
  end

  def run
    prompt_for_location
    get_dictionary
    print_statistics
    kind_of_search
    search_term
    @searcher.search
  end

  private

  def prompt_for_location
    puts "Where is your dictionary? ('q' to quit) "
    print "> "
    @file_name = gets.chomp
  end

  def quit
    puts "User chose to quit..."
    puts "Goodbye!"
    exit
  end

  def get_dictionary
    quit if @file_name == 'q'
    @dictionary = DictionaryLoader.new(@file_name).load
    puts "Dictionary succesfully loaded"
  end

  def print_statistics
    puts "Your dictionary contains #{@dictionary.total_words} words."
    puts "Word frequency by starting letter: "
    @dictionary.word_count.keys.sort.each do |letter|
      print "#{letter.upcase}: #{@dictionary.word_count[letter]}\n"
    end
  end

  def kind_of_search
    until @kind_of_search <= 4 && @kind_of_search >= 1
      puts "What kind of search?"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With"
      puts "4: Ends With"
      print "> "
      @kind_of_search = gets.chomp.to_i
    end
  end

  def search_term
    puts "Enter the search term"
    print "> "
    @search_term = gets.chomp.downcase
    @searcher = DictionarySearcher.new(@dictionary, @kind_of_search, @search_term)
  end

end
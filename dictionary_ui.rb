
=begin
 DictionaryUI is the main class which handles the user interaction loop.

 Documents/Viking/Ruby/dictionary

 require "pry"
 binding.pry
=end

require "./dictionary_loader.rb"
require "./dictionary_searcher.rb"

class DictionaryUI
  def initialize
    locate
  end

  def locate
# TODO user input validation
    puts "Where is your dictionary?"
    puts " Please enter the file name and location in the following format"
    puts " path/to/myfile.csv"
    puts " Or enter q to quit\n\n"
    path = gets.chomp
    quit?(path)
    load(path)
  end

  def quit?(input)
    exit if input == "q"
  end

  def load(file_path)
    l = DictionaryLoader.new(file_path)
    @book = l.read
    statistics
  end

  def statistics
# TODO break up into seperate classes?, finish second stat
    puts "\nDictionary successfully loaded"
    puts "Your dictionary contains #{@book.dictionary.length} words."
    #puts "Word frequency by starting letter:"
    search
  end

  def search
# TODO user input validation
    puts "\nWhat kind of search would you like to do?"
    puts " Enter a number below to select the search type:"
    puts "1 - Exact\n2 - Partial\n3 - Begins With\n4 - Ends With\n\n"
    type = gets.chomp
    print "\nWhat word would you like to search for? "
    term = gets.chomp
    @s = DictionarySearcher.new(@book.dictionary, type, term)
    plural = "es" if @s.results.length > 1
    puts "\nFound #{@s.results.length} match#{plural}:"
    puts @s.results
    save
  end

  def save
    puts "\nDo you want to save the results?"
    puts " Please enter y for yes or n for no, alternatively enter q to quit."
    choice = gets.chomp
    quit?(choice)

  end

end

s = DictionaryUI.new








# spacing

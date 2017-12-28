
=begin
 DictionaryUI is the main class which handles the user interaction loop.

 Documents/Viking/Ruby/dictionary

 require "pry"
 binding.pry
=end

require "./dictionary_loader.rb"

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
# TODO break up into seperate classes, finish second stat
    puts "\nDictionary successfully loaded"
    puts "Your dictionary contains #{@book.dictionary.length} words."
    #puts "Word frequency by starting letter:"
    search
  end

  def search
=begin
 What kind of search?
 1: Exact
 2: Partial
 3: Begins With
 4: Ends With

 Enter the search term

 DictionarySearcher.new(@book.dictionary, type, term)

 puts "Found #{results.length} matches:"
 puts results

 TODO user input validation
=end
  end
end

s = DictionaryUI.new








# spacing

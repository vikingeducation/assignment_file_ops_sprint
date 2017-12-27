
=begin
 DictionaryUI is the main class which handles the user interaction loop.

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
  end
end

s = DictionaryUI.new








# spacing


=begin
 DictionaryUI is the main class which handles the user interaction loop.

 cd Documents/Viking/Ruby/dictionary

 require "pry"
 binding.pry

 TODO for all project files
 1. implement user input validation/should be able to quit in any prompt
 2. break up methods (as needed)
 3. review naming
 4. checklist items
=end

require "./dictionary_loader.rb"
require "./dictionary_searcher.rb"
require "./results_saver.rb"

class DictionaryUI
  def initialize
    system 'cls'
    system 'clear'
    locate
  end

  def locate
# TODO user input validation
    puts "\nWhere is your dictionary?"
    puts " Please enter the file name and/or location in the following format"
    puts " path/to/myfile.extension"
    puts " Or enter q to quit in any prompt\n\n"
    path = gets.chomp
    quit?(path)
    load(path)
  end

  def quit?(input)
    exit if input == "q"
  end

  def load(path)
# TODO test with different files in different paths
    l = DictionaryLoader.new(path)
    if l.read == 0
      puts "\nFile not found, try entering again"
      locate
    else
      @book = l.read
      statistics
    end
  end

  def statistics
# TODO break up into seperate classes?, finish second stat
    puts "\nDictionary successfully loaded"
    puts "Your dictionary contains #{@book.dictionary.length} words."
    #puts "Word frequency by starting letter:"
    search
  end

  def search
# TODO user input validation, split into seperate methods?
    puts "\nWhat kind of search would you like to do?"
    puts " Enter one of the numbers below to select the search type:"
    puts "1 - Exact\n2 - Partial\n3 - Begins With\n4 - Ends With\n\n"
    type = gets.chomp
    print "\nWhat word would you like to search for? "
    term = gets.chomp
    @s = DictionarySearcher.new(@book.dictionary, type, term)
    plural = "es" if @s.results.length > 1
      puts "\nFound #{@s.results.length} match#{plural}:"
      puts @s.results
# TODO change what happens if there are no results
      save
  end

  def save
# TODO user input validation, split into seperate methods?
    puts "\nDo you want to save the results?"
    puts " Please enter y for yes or n for no, alternatively enter q to quit."
    puts ''
    choice = gets.chomp
    quit?(choice)
    case choice
    when "y"
      store
    when "n"
      search
    else
      # bad input
    end
  end

  def store
# TODO user input validation, split into seperate methods?
    how = nil
    puts "\nWhere should the results be stored in a file at?"
    puts " Please enter the file name and/or location in the following format"
    puts " path/to/myfile.extension"
    puts ''
    where = gets.chomp
    if File.file?(where)
      puts "\nThat file aready exists, should it be overwritten?"
      puts " Please enter y for yes or n for no, alternatively enter q to quit."
      puts ''
      choice = gets.chomp
      if choice == "y"
        how = "replace"
      else
        # bad input
      end
    end
      w = ResultsSaver.new(@s.results, where, how)
      # confirm results were saved, and puts result
      search
  end

end

s = DictionaryUI.new








# spacing

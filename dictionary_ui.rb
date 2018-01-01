
=begin
 DictionaryUI is the main class which handles the user interaction loop.

 cd Documents/Viking/Ruby/dictionary

 require "pry"
 binding.pry

 TODO (for this file and results_saver)
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
      count
    end
  end

  def count
    puts "\nDictionary successfully loaded"
    puts "Your dictionary contains #{@book.dictionary.length} words"
    frequency
  end



=begin
# Word frequency by starting letter:
# A: 123
# B: 456
=end


  def frequency
    letters = { "A" => 0, "B" => 0, "C" => 0, "D" => 0, "E" => 0, "F" => 0,
                "G" => 0, "H" => 0, "I" => 0, "J" => 0, "K" => 0, "L" => 0,
                "M" => 0, "N" => 0, "O" => 0, "P" => 0, "Q" => 0, "R" => 0,
                "S" => 0, "T" => 0, "U" => 0, "V" => 0, "W" => 0, "X" => 0,
                "Y" => 0, "Z" => 0}
    @book.dictionary.each do |word|
      letters.each_pair { |key, value| letters[key] += 1 if word[0] == key.downcase }
    end
    puts "Word frequency by starting letter:"
    letters.each_pair {|key, value|
      puts "#{key}: #{value}"
    }

# get this working to confirm the total word count matches frequency word count
    letters.each_value {|key|
    total += key
    puts total
    }

    search
  end



  def search
# TODO user input validation, split into seperate methods?
    puts "\nWhat kind of search would you like to do?"
    puts " Enter one of the numbers below to select the search type:"
    puts "1 - Exact\n2 - Partial\n3 - Begins With\n4 - Ends With\n\n"
    type = gets.chomp
    print "\nWhat would you like to search for? "
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
    puts " Please enter y for yes or n for no, alternatively enter q to quit"
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
      puts " Please enter y for yes or n for no, alternatively enter q to quit"
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

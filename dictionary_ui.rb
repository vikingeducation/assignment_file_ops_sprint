require_relative 'dictionary_searcher'

class DictionaryUI

  # attr_reader :search_type

  def initialize
    @search_type = nil
    @word_search = nil
    @searcher = DictionarySearcher.new
  end

  def user_file_path
    puts "Welcome to Dictionary."
    puts "Where is your dictionary? ('q' to quit)"
    input = gets.chomp
    if input == "q"
      puts "Okay, bye"
      exit
    else
      return input
    end
  end


  def run
    # ask for user file path
    file_path = user_file_path
    # ask for search type
    user_search_type
    # ask for word
    user_word

    matches = @searcher.find_matches(@search_type, @word_search)
    puts "Here are your matches: #{matches}"

  end


  def user_search_type
    puts "What kind of search? Please enter 1-4."
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends with"
    @search_type = gets.chomp.to_i
  end


  def user_word
    puts "Enter the search term"
    @word_search = gets.chomp.upcase
  end

end


d = DictionaryUI.new
d.run

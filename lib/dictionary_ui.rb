# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  attr_accessor :loader, :dictionary, :searcher, :results_saver

  def initialize
  end

  # In the dictionary_searcher
    # exact match search
    # partial match search
    # begins with match search
    # ends with match search
  # display the number of matches and those matches

  # ask the user if they want to save their results 
  # ask for the name of the file that they want to save to

  def run
    puts "Where is your dictionary? ('q' to quit)"
    location = get_user_input
    @loader = DictionaryLoader.new(location)
    @dictionary = @loader.dictionary
    puts "Dictionary successfully loaded"
    word_frequency
    puts "How do you want to search?"
    puts "1: Exact match, 2: Partial match, 3: Begins with, 4: Ends with"
    choice = get_user_input
    puts "Enter the search term"
    search_term = get_user_input
    @searcher = DictionarySearcher.new
    @searcher.which_match(choice, search_term)
  end

  def get_user_input
    input = gets.chomp
    exit if input == 'q'
  end

  def word_frequency
    puts "Your dictionary has #{@dictionary.file.length} words"
    puts "Word frequency by starting letter."

    @dictionary.frequency
    @dictionary.frequency_hash.each do |key, value|
      puts "#{key}: #{value}"
    end
  end
end


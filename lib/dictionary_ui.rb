# DictionaryUI is the main class which handles the user interaction loop.
require 'pry'
class DictionaryUI

  attr_accessor :dictionary, :searcher, :results_saver

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
    load_the_file
    word_frequency
    match_the_word
  end

  def load_the_file
    puts "Where is your dictionary? ('q' to quit)"
    dictionary_location = get_user_input
    @loader = DictionaryLoader.new(dictionary_location)
    @dictionary = Dictionary.new(@loader.file_array)
    puts "Dictionary successfully loaded"
  end

  def match_the_word
    puts "How do you want to search?"
    puts "1: Exact match, 2: Partial match, 3: Begins with, 4: Ends with"
    choice = get_user_input
    puts "Enter the search term"
    search_term = get_user_input

    matches = @dictionary.search_match(choice, search_term)
    puts matches
  end

  def get_user_input
    input = gets.chomp
    exit if input == 'q'
    input
  end

  def word_frequency
    puts "Your dictionary has #{@dictionary.file.length} words"
    puts "Word frequency by starting letter."
    alphabet_hash = @dictionary.letter_frequency
    alphabet_hash.each do |key, value|
      puts "#{key}: #{value}"
    end
  end
end


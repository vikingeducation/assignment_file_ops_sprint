# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  attr_accessor :loader, :dictionary, :searcher, :results_saver

  def initialize
  end

  #
  #
  # 
  # return wordcount 
  # number of words by starting letter

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
    # @dictionary_searcher = DictionarySearcher.new(@dictionary)
    puts "Dictionary successfully loaded"
    puts "Your dictionary has #{@dictionary.file.class} words"
  end


  def get_user_input
    input = gets.chomp
    if input == 'q'
      exit
    else
      input
    end
  end

end


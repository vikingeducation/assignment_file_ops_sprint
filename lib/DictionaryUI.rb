# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'Dictionary'
require_relative 'DictionaryLoader'
require_relative 'DictionarySearcher'
require_relative 'Resultssaver'

class DictionaryUI

  attr_accessor :loader, :dictionary, :searcher, :results_saver

  def initialize
  end

  def run
    puts "Where is your dictionary? ('q' to quit)"
    location = get_user_input
    @loader = DictionaryLoader.new(location)
    @dictionary = @loader.dictionary
    @dictionary_searcher = DictionarySearcher.new(@dictionary)
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{@dictionary_searcher.word_count} words"
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

d = DictionaryUI.new
d.run
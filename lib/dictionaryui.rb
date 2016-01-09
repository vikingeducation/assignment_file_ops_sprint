# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'dictionaryloader'

class DictionaryUI

  def initialize
    @dictionary_loader = DictionaryLoader.new
    @file_location = nil
  end

  def run
    print "Where is your dictionary? ('q' to quit): "
    response = gets.chomp
    exit if quit?(response)
    @dictionary_loader.load_file(response)
  end

  def quit?(response)
    response == 'q'
  end
end
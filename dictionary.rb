require_relative 'dictionary_loader'
require_relative 'dictionary_analyzer'

class Dictionary
  attr_reader :dictionary
  def initialize
    print "What is the name of the dictionary you want to load?\n > "
    @dictionary_name = gets.chomp
    @dictionary = DictionaryLoader.new(@dictionary_name).words
  end
end

# Create a class (e.g. Dictionary) to handle the user interaction loop. The first prompt is to read in a dictionary file.
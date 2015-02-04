require_relative 'dictionary_loader'
require_relative 'dictionary_analyzer'

class Dictionary
  attr_reader :dictionary, :analyzer
  def initialize
    print "What is the name of the dictionary you want to load?\n > "
    dictionary_name = gets.chomp
    @dictionary = DictionaryLoader.new(dictionary_name).words
    @analyzer = DictionaryAnalyzer.new(dictionary)
    print "How would you like to search?\n1 for an exact match\n2 for partial matches\n3 to match beginning of word\n4 to match end of word\n > "
    search_style = gets.chomp
    print "Enter your search string\n > "
    search_string = gets.chomp
    search_results = analyzer.search(search_style,search_string)
    print "I found #{search_results.length} results."
  end
end

# Create a class (e.g. Dictionary) to handle the user interaction loop. The first prompt is to read in a dictionary file.
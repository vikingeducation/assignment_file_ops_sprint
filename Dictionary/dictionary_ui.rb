require_relative 'dictionary.rb'
require_relative 'dictionary_loader.rb'

class DictionaryUI
  def get_dictionary_location
    puts "Where is your dictionary"
    @location = gets.strip
  end

  def go 
    get_dictionary_location
    @dictionary = DictionaryLoader.new
    @stats = Dictionary.new
    @stats.compute_dictionary_stats(@dictionary.load_dictionary(@location))
    @stats.display_dictionary_stats
  end
end

a = DictionaryUI.new
a.go
require_relative 'dictionary_loader.rb'

class DictionaryUI
  def get_dictionary_location
    puts "Where is your dictionary"
    @location = gets.strip
  end

  def go 
    get_dictionary_location
    @stats = DictionaryLoader.new
    @stats.compute_dictionary_stats(@location)
    @stats.display_dictionary_stats
  end
end

a = DictionaryUI.new
a.go
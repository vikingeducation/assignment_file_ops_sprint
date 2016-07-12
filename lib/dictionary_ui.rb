require_relative "dictionary_loader"
require_relative "dictionary"
require_relative "dictionary_searcher"
require_relative "results_saver"

class DictionaryUI

  def display
    puts "What word to you want to lookup?"
    word_to_lookup = gets.strip
    puts "Do you want to search for:"
    puts "1. Exactly the word"
    puts "2. Partial"
    puts "3. Beginning of a word"
    puts "4. End of a word"
    user_choice = gets.chomp
    puts "Where do you want to save it?"
    place_to_save = gets.chomp
    ResultsSaver.new.save(word_to_lookup, user_choice, place_to_save)
  end

end

DictionaryUI.new.display

require_relative 'dictionary_loader.rb'
require_relative 'dictionary'
require_relative 'dictionary_searcher'
require_relative 'results_saver'


class DictionaryUI

  def run
    loop do
      puts "Where is your dictionary? ('q' to quit)"
      file_location = gets.chomp
      break if file_location == 'q'
      dictionary = Dictionary.new(file_location)
      puts "Dictionary successfully loaded" if dictionary != nil
      puts "Your dictionary contains #{dictionary.word_count} words."
      puts "Word frequency by starting letter:"
      dictionary.display_words_by_numbers
      searcher = DictionarySearcher.new(dictionary.file)
      search_results = searcher.choose_search_and_display
      saver = ResultsSaver.new(search_results)
      break if saver.results_saver
    end
  end

end
#DictionaryUI
require './Dictionary'
require './DictionaryLoader'
require './DictionarySearcher'
require './ResultsSaver'

class DictionaryUI

  def run
    puts "Where is your dictionary?"
    file_path = gets.chomp
    dict_loader = DictionaryLoader.new
    @dictionary = dict_loader.load(file_path)
    @stats=@dictionary.stats
    print_stats
  end
  
  def print_stats
    puts "Dictionary succesfully loaded"
    puts "Your dictionary contains #{@stats[:word_count]} words"
    puts "Word frequency by starting letter:"
    @stats[:words_by_starting_letter].each do |k,v|
      puts "#{k}: #{v}"
    end
  end
end

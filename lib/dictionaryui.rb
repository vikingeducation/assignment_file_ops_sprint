require_relative 'dictionary-loader'
require_relative 'dictionary-searcher'
require_relative 'results_saver'

class DictionaryUI
  attr_reader :loaded_dictionary

  def initialize
    @loaded_dictionary = nil
  end

  def run
    puts "Where is your dictionary?"
    # q to quit?
    path = gets.chomp
    @loaded_dictionary = DictionaryLoader.new(path)
    @loaded_dictionary.get_dictionary
    searcher = DictionarySearcher.new(@loaded_dictionary.dictionary.dict_arr)
    searcher.ask_user
  end

  def loaded_dictionary
    @loaded_dictionary
  end



end


d = DictionaryUI.new
d.run

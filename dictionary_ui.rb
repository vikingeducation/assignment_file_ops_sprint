require_relative "dictionary_loader"
require_relative "dictionary_searcher"
require_relative "results_saver"

# handles the user interaction loop
class DictionaryUI

  attr_accessor :dict, :dict_searcher
  attr_reader :dict_loader, :results_saver

  def initialize
    @dict_loader = DictionaryLoader.new
    @results_saver = ResultsSaver.new
  end

  def run
    puts "Insert the location of your dictionary file:"
    print "> "
    dict_path = gets.strip
    dict = dict_loader.load(dict_path)
    dict_searcher = DictionarySearcher.new(dict)
    result = dict_searcher.run()
    results_saver.run(result)
  end

end

dict = DictionaryUI.new
dict.run

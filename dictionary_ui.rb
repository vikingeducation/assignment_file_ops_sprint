require "./dictionary_loader"
require "./dictionary"

class DictionaryUI

  def run
    @loader = DictionaryLoader.new
    @searcher = DictionarySearcher.new

    @dictionary = @loader.load_dictionary
    @d = Dictionary.new(@dictionary)

    @d.dictionary_length
    @d.dictionary_stats
    @d.search_dictionary
    @d.save
    @loader.close_dictionary(@dictionary)

  end







end


d = DictionaryUI.new
d.run
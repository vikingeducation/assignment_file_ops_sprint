require "./dictionary_loader"

class DictionaryUI

@loader = DictionaryLoader.new

  def run
#@loader = DictionaryLoader.new
    @loader.load_dictionary

  end







end


d = DictionaryUI.new
d.run
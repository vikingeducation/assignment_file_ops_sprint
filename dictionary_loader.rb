require_relative 'dictionary_ui'

class DictionaryLoader
  
  
  def load
    File.readlines(DictionaryUI.new.run).map(&:chomp)
  end

end
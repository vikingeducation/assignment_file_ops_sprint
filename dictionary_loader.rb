require_relative 'dictionary_ui'

class DictionaryLoader
  
  
  def load(path)
    File.readlines(path).map(&:chomp)
  end

end
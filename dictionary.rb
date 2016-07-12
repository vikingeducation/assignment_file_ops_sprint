require_relative 'dictionary_loader'

class Dictionary
  attr_reader :load

  def initialize(path)
    @path = path
    @load = DictionaryLoader.new.load(@path)
  end

  

end
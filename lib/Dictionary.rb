require 'DictionaryLoader'

class Dictionary
  attr_reader :words

  def initialize
    @words = DictionaryLoader.new
  end

end
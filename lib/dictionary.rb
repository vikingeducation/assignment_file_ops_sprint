require_relative './dictionary_loader'

class Dictionary
  attr_reader :words
  def initialize
    words = DictionaryLoader.load("dictionary.txt")
  end
end
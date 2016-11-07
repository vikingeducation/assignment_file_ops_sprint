# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.

class DictionaryLoader

  attr_accessor :dictionary

  def initialize(file_path)
    file = File.open(file_path, "r")
    @dictionary = Dictionary.new(file)
  end


end

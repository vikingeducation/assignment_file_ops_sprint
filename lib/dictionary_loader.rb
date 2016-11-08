# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.

class DictionaryLoader

  attr_accessor :file_array

  def initialize(file_path)
    @file_array = File.readlines(file_path)
  end

end

# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.

class DictionaryLoader

  attr_accessor :dictionary

  def initialize(file_path)
  	arr = []
    File.open(file_path, "r") do |item|
    	arr = item.readlines
    end

    @dictionary = Dictionary.new(arr)
  end


end

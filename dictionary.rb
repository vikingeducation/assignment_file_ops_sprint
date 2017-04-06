# class that wraps the loaded dictionary
require_relative 'dictionary_loader'

class Dictionary

  def initialize(path)
    @path = path
  end

  def dictionary_wrap
    new_dictionary = DictionaryLoader.new(@path)
    @dictionary = new_dictionary.load_file
  end

  @dictionary

end

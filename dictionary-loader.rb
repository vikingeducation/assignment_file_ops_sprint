require 'dictionaryui'
require 'dictionary'

class DictionaryLoader
  def initialize(path)
    @path = path

  end


  def get_dictionary
    dict_arr = File.readlines(@path, 'r')
    Dictionary.new(dict_arr)
  end

  def valid_path?
    raise ArgumentError unless File.exists?(@path) 
  end

     puts "Dictionary successfully loaded"
# Your dictionary contains 12345 words.
# Word frequency by starting letter:
# A: 123
# B: 456

end
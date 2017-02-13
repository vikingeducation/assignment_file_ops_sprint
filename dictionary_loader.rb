require_relative 'dictionary.rb'

class DictionaryLoader

  def initialize (file_name)
    @file_name = file_name
    @dictionary = []
  end

  def load
    File.readlines(@file_name).map do |word|
      @dictionary << word.strip.downcase
    end
    Dictionary.new(@dictionary)
  end

end
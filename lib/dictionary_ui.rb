require_relative 'dictionary'
require_relative 'dictionary_loader'

class DictionaryUI

  attr_accessor :path

  def initialize
    @path = nil
    run
  end

  def run
    puts 'Where is your dictionary? (\'q\' to quit)'
    get_path
    @dictionary_file = DictionaryLoader.load_dict(@path)
    @dictionary = Dictionary.new(@dictionary_file)
  end

  def get_path
    @path = gets.chomp
  end

end

t = DictionaryUI.new

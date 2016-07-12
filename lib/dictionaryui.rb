require_relative 'dictionary-loader'


class DictionaryUI
  attr_reader :loaded_dictionary

  def initialize
    @loaded_dictionary = nil
  end

  def run
    puts "Where is your dictionary? ('q' to quit)"
    path = gets.chomp
    @loaded_dictionary = DictionaryLoader.new(path)
    @loaded_dictionary.get_dictionary
  end

  def loaded_dictionary
    @loaded_dictionary
  end

end


d = DictionaryUI.new
d.run

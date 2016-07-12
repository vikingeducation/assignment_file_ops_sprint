require_relative 'dictionary_ui'

class DictionaryLoader
  attr_reader :dictionary
  
  def initialize
    @dictionary = File.readlines(DictionaryUI.new.run).map(&:chomp)
  end

end
require_relative 'Dictionary'
require_relative 'DictionaryLoader'
require_relative 'DictionarySearcher'
require_relative 'ResultsSaver'

class DictionaryUI

  def initialize
    puts "Welcome to Dictionary"
  end

  def prompt_for_file_path
    print "Enter file path of dictionary \n > "
    path = gets.chomp
    path
  end

  def main
    path = prompt_for_file_path
    dict = DictionaryLoader.new(path).words    
    p dict
  end

end

DictionaryUI.new.main
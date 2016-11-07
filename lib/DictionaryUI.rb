require_relative 'Dictionary'
require_relative 'DictionaryLoader'
require_relative 'DictionarySearcher'
require_relative 'ResultsSaver'

require 'pry'
require 'pry-byebug'

class DictionaryUI

  def initialize
    puts "Welcome to Dictionary"
  end

  def prompt_for_file_path
    print "Enter file path of dictionary \n > "
    path = gets.chomp
    path = "5desk.txt" if path == ""
    path
  end

  def main
    path = prompt_for_file_path
    dict = DictionaryLoader.createDictionaryFrom(path)
    p dict
  end

end

DictionaryUI.new.main

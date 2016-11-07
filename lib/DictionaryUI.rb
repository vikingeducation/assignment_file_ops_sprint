require 'Dictionary'
require 'DictionaryLoader'
require 'DictionarySearcher'
require 'ResultsSaver'

class DictionaryUI
  def initialize
    puts "Welcome to Dictionary"
  end
  def prompt_for_file_path
    print "Enter file path of dictionary \n > "
    path = gets.chomp
    path
  end
end

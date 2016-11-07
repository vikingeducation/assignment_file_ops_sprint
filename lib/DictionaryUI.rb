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
    path = "5desk.txt" if path == ""
    path
  end

  def prompt_for_search
    puts "What kind of search would you like to perform?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
  end

  def main
    path = prompt_for_file_path
    dict = DictionaryLoader.createDictionaryFrom(path)
  end

end

DictionaryUI.new.main

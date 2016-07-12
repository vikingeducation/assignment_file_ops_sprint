require_relative 'dictionary_loader'
require_relative 'dictionary'
require_relative 'dictionary_searcher.rb'

#dictionary_ui.rb
class DictionaryUI

  def initialize
  end 

  def run 
    prompt
    # dictionary_path = gets.chomp
    dictionary_path = "5desk.txt"
    dict = Dictionary.new(dictionary_path)
   
    puts "Enter your word/phrase: "

    word = gets.chomp.downcase

    puts "Search for words in dictionary that match: "
    puts "exact, partial, begins, ends"

    option = gets.chomp.downcase

    DictionarySearcher.new.search(dict, word, option)

  end

  def prompt
    puts "Where is your dictionary? ('q' to quit)"
  end

  def sdfsf
  end

end

# puts File.dirname("5desk.txt")
# puts File.expand_path(File.dirname("5desk.txt"))
a = DictionaryUI.new
a.run
require_relative 'dictionary_loader'
require_relative 'dictionary'

#dictionary_ui.rb
class DictionaryUI

  def initialize
  end 

  def run 
    prompt
    #dictionary_path = gets.chomp
    dictionary_path = "5desk.txt"
    dict = Dictionary.new(dictionary_path)

    print dict.print_stats
  end

  def prompt
    puts "Where is your dictionary? ('q' to quit)"
  end

end

# puts File.dirname("5desk.txt")
# puts File.expand_path(File.dirname("5desk.txt"))
a = DictionaryUI.new
a.run
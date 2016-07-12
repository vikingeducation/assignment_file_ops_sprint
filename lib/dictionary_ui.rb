require_relative 'dictionary_loader'
require_relative 'dictionary'

#dictionary_ui.rb
class DictionaryUI

  def run 
    prompt
    # dictionary_path = gets.chomp
    dictionary_path = "5desk.txt"
    dict = Dictionary.new(dictionary_path)
    dict.print_stats
  end

  def prompt
    puts "Where is your dictionary? ('q' to quit)"
  end

  def enter_search
    
  end

end

# puts File.dirname("5desk.txt")
# puts File.expand_path(File.dirname("5desk.txt"))
a = DictionaryUI.new
a.run
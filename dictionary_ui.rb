class DictionaryUI

  def initialize

  end 

  def run 
    prompt
    dictionary_path = gets.chomp
  end

  def prompt
    puts "Where is your dictionary? ('q' to quit)"
  end

end

# puts File.dirname("5desk.txt")
# puts File.expand_path(File.dirname("5desk.txt"))

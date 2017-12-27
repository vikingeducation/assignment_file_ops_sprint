
# DictionaryUI is the main class which handles the user interaction loop.

require "./dictionary_loader.rb"

class DictionaryUI
  def initialize
    locate
  end

  def locate
    puts "Where is your dictionary?"
    puts " Please enter the file name and location in the following format"
    puts " path/to/myfile.csv"
    puts " Or enter q to quit\n\n"
    path = gets.chomp
    quit?(path)
    load(path)
  end

  def quit?(input)
    exit if input == "q"
  end

  def load(file_path)
    l = DictionaryLoader.new(file_path)
    @dictionary = l.read
  end
end

d = DictionaryUI.new

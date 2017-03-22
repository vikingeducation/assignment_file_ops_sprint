require_relative './dictionary_loader'
require_relative './dictionary'

class DictionaryUI
  def prompt
    puts "Where is your dictionary? ('q' to quit)"

    filename = gets.chomp.downcase

    filename == 'q' ? exit : filename
  end

  def run
    filename = prompt
    dict = DictionaryLoader.new.load(filename)
    puts dict
  end
end
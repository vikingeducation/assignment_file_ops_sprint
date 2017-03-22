require_relative './dictionary_loader'
require_relative './dictionary'

class DictionaryUI
  def prompt
    puts "Where is your dictionary? ('q' to quit)"

    dictionary_path = gets.chomp.downcase

    dictionary_path == 'q' ? exit : dictionary_path
  end

  def run
    dictionary_path = prompt
    dict = DictionaryLoader.new.load(dictionary_path)
    puts dict
  end
end
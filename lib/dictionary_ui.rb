require_relative './dictionary_loader'
require_relative './dictionary'

class DictionaryUI
  def ask_for_filename
    puts "Where is your dictionary? ('q' to quit)"

    filename = gets.chomp.downcase

    filename == 'q' ? exit : filename
  end

  def run
    # get filename of dictionary file
    filename = ask_for_filename

    # get Dictionary object
    dict = DictionaryLoader.new.load(filename)

    # print initial statistics
    puts dict

    # prompt user for type of search
  end
end
require_relative './dictionary_loader'
require_relative './dictionary'

class DictionaryUI
  def ask_for_filename
    puts "Where is your dictionary? ('q' to quit)"

    filename = gets.chomp.downcase

    filename == 'q' ? exit : filename
  end

  def ask_for_search_type
    search_type = ""

    loop do
      puts "What kind of search?"
      puts "1. Exact"
      puts "2. Partial"
      puts "3. Begins with"
      puts "4. Ends with"
      print "Enter your choice > "

      search_type = gets.chomp

      break if (1..4).include?(search_type.to_i)
    end

    search_type
  end

  def run
    # get filename of dictionary file
    filename = ask_for_filename

    # get Dictionary object
    dictionary = DictionaryLoader.new.load(filename)

    # print initial statistics
    puts dictionary

    # prompt user for type of search
  end
end
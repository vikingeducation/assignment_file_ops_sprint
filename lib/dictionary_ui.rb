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

      if (1..4).include?(search_type.to_i)
        break
      else
        puts "Invalid choice. Please try again."
      end
    end

    search_type
  end

  def ask_for_search_term
    print "Enter the search term > "

    search_term = gets.chomp
  end

  def save_results?
    print "Do you wish to save your search results? (y/n) 'q' quits. > "

    response = gets.chomp.downcase

    case response
    when "y"
      true
    when "n"
      false
    when "q"
      exit
    end
  end

  def ask_for_filename_to_save_to
    loop do
      puts "What filename should we save results to?"
      filename = gets.chomp

      if File.exist?(filename)
        puts "That file already exists. Overwrite? (y/n)"

        response = gets.chomp.downcase

        if response == "y"
          return filename
        elsif response == "n"
          next
        else
          puts "Invalid response."
          next
        end
      else
        return filename
      end
    end
  end

  def run
    # get filename of dictionary file
    filename = ask_for_filename

    # get Dictionary object
    dictionary = DictionaryLoader.new.load(filename)

    # print initial statistics
    puts dictionary

    # create DictionarySearcher
    dictionary_searcher = DictionarySearcher.new(dictionary)

    # ask user for search type and term
    search_type = ask_for_search_type
    search_term = ask_for_search_term

    # run search
    results = dictionary_searcher.run_search(search_type, search_term)

    # display results
    dictionary_searcher.display_results(results)
  end
end
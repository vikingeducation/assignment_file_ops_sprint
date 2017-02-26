# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  attr_accessor :dictionaryL, :dictionaryS, :results_saver

  def initialize
    @dictionaryL = DictionaryLoader.new
    @dictionaryS = DictionarySearcher.new
    # @results_saver = ResultsSaver.new
  end

  def run
    loop do
      puts "Where is your dictionary? ('q' to quit)"
      file_path = gets.chomp

      until file_path == "test.txt" || file_path == "q"
        puts 'Dictionary not found, please specify your file again'
        file_path = gets.chomp
      end

      break if file_path == "q"
      @dictionaryL.load(file_path)
      search
    end
  end

  def search
    puts "What kind of search?"
    puts "1. Exact matches"
    puts "2. Partial matches"
    puts "3. Begins With"
    puts "4. Ends With"
    search_method = gets.chomp

    until search_method == "1" || search_method == "2" ||search_method == "3" || search_method == "4" 
      puts 'Search method not valid, please specify your search method again'
      search_method = gets.chomp
      
    end

    puts "Enter the search term"
    search_term = gets.chomp

    @dictionaryS.search(search_method, search_term)
  end

  def prompt_user_to_save
    puts "Do you want to save results? y/n? 'q' quits."
    save_file = gets.chomp
    puts "What filepath should we write results to?"
    save_filepath = gets.chomp
      
      if file_path exists
        puts "That file exists, overwrite? y/n? 'q' quits."
      else
        # call save menthod
        puts "File successfully overwritten!"
      end
  end
end


# DictionaryUI is the main class which handles the user interaction loop.

require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  attr_accessor :dictionaryL, :dictionaryS, :results_saver, :dictionary

  def initialize
    @dictionaryL = DictionaryLoader.new
    @dictionaryS = DictionarySearcher.new
    @results_saver = ResultsSaver.new
  end

  def run
    get_dictionary
    search_dictionary
    process_save
  end

  def get_dictionary
    puts "Where is your dictionary? ('q' to quit)"
    file_path = gets.chomp

    until File.file?(file_path)
      puts 'Dictionary not found, please specify your file again'
      file_path = gets.chomp
    end

    quit if file_path == "q"
    @dictionaryL.load(file_path)
    @dictionary = @dictionaryL.dict_file
  end

  def search_instructions
    puts "*******************"
    puts "What kind of search?"
    puts "1. Exact matches"
    puts "2. Partial matches"
    puts "3. Begins With"
    puts "4. Ends With"
  end

  def search_dictionary

    search_instructions
    search_method = gets.chomp

    until search_method == "1" || search_method == "2" ||search_method == "3" || search_method == "4"
      puts 'Search method not valid, please specify your search method again'
      search_method = gets.chomp
    end

    search_method = search_method.to_i

    puts "Enter the search term"
    search_term = gets.chomp

    @dictionaryS.search(search_method, search_term, @dictionary.words
      )
    @dictionaryS.output_matches
  end

  def request_save
    puts "Do you want to save results? y/n? 'q' quits."
    gets.chomp
  end

  def process_save
    
    save_file = request_save

    if(save_file == "y")
      puts "What filepath should we write results to?"
      save_filepath = gets.chomp
       
      # Should we overwrite? 
      if File.file?(save_filepath)
        puts "That file exists, overwrite? y/n? 'q' quits."
        overwrite = gets.chomp 
        overwrite_process(overwrite, save_filepath)
      else
        @results_saver.save(@dictionaryS.words_found, save_filepath)
        puts "File saved"
      end
    elsif(save_file == "q")
        quit
    elsif (save_file == "n")
      puts "You chose not to save"
    end
  end

  def overwrite_process(overwrite, save_filepath)
    if(overwrite == "y")       
      @results_saver.save(@dictionaryS.words_found, save_filepath)
      puts "File successfully overwritten!"
    elsif(overwrite == "n")  
      puts "Choose another filepath"
      save_filepath = gets.chomp     
      @results_saver.save(@dictionaryS.words_found, save_filepath) 
      puts "File saved"
    end     
  end

  def quit
    puts "Goodbye! See you next time!"
    exit  
  end
end


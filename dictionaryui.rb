require_relative 'dictionary_loader.rb'
require_relative 'dictionary.rb'
require_relative 'dictionary_searcher.rb'
require_relative 'results_saver.rb'

class DictionaryUI

  def run
    prompt_for_location
    get_dictionary
    print_statistics
    kind_of_search
    search_term
    @searcher.search
    save
  end

  private

  def prompt_for_location
    puts "Where is your dictionary? ('q' to quit) "
    print "> "
    @file_name = ""
    @file_name = gets.chomp until File.file?(@file_name) || @file_name == "q"
    quit if @file_name == 'q'
  end

  def quit
    puts "User chose to quit..."
    puts "Goodbye!"
    exit
  end

  def get_dictionary
    @dictionary = DictionaryLoader.new(@file_name).load
    puts "Dictionary succesfully loaded" if @dictionary
  end

  def print_statistics
    puts "Your dictionary contains #{@dictionary.total_words} words."
    puts "Word frequency by starting letter: "
    @dictionary.word_count.keys.sort.each do |letter|
      print "#{letter.upcase}: #{@dictionary.word_count[letter]}\n"
    end
  end

  def kind_of_search
    @kind_of_search = nil
    until (1..4).include?(@kind_of_search)
      puts "What kind of search?"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With"
      puts "4: Ends With"
      print "> "
      @kind_of_search = gets.chomp.to_i
    end
  end

  def search_term
    puts "Enter the search term"
    print "> "
    @search_term = ""
    @search_term = gets.chomp.downcase while @search_term.empty?
    @searcher = DictionarySearcher.new(@dictionary, @kind_of_search, @search_term)
  end

  def save
    prompt_for_saving
    overwrite if file_exists?
    ResultsSaver.new(@filepath, @searcher.matches, @search_term).save
    puts "Your results are saved!"
    exit
  end

  def prompt_for_saving
    puts "Do you want to save results? y/n 'q' quits."
    print "> "
    answer = ""
    answer = gets.chomp.downcase until ["y", "n", "q"].include?(answer)
    if answer == "n"
      puts "User chose not to save. Goodbye!"
      exit
    elsif answer == "q"
      quit
      exit
    end
    prompt_for_filepath
  end

  def prompt_for_filepath
    puts "What filepath should we write results to?"
    print "> "
    @filepath = ""
    @filepath = gets.chomp while @filepath.empty?
  end

  def overwrite
    answer = ""
    until answer == "y" || !file_exists?
      puts "That file exists, overwrite? y/n? 'q' quits."
      print "> "
      answer = ""
      answer = gets.chomp.downcase until ["y", "n", "q"].include?(answer)
      if answer == "n"
        puts "Choose another filepath!"
        print "> "
        @filepath = gets.chomp
      elsif answer == "q"
        quit
        exit
      end
    end
  end

  def file_exists?
    File.file?(@filepath)
  end


end
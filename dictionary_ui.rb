require_relative 'dictionary_loader'
require_relative 'dictionary'
require_relative 'dictionary_searcher'
require_relative 'results_saver'


class DictionaryUI


  def run
    loop do
      puts "Where is your dictionary? ('q' to quit) (load your file or the attached by typing 5desk.txt)"
      file_location = gets.chomp
      break if file_location == 'q'
      redo unless directory_exists?(file_location)
      search_results = searching_screens(loading_screens(file_location))
      saver = ResultsSaver.new(search_results)
      break if saver.results_saver
    end
  end

  private

  def loading_screens(file_location)
    dictionary = Dictionary.new(file_location)
    puts "Dictionary successfully loaded" unless dictionary
    puts "Your dictionary contains #{dictionary.word_count} words."
    puts "Word frequency by starting letter:"
    dictionary.display_words_by_numbers
    dictionary
  end

  def directory_exists?(directory)
    File.dirname(directory) ? true : (puts "The file directory is incorrect. Please try again.")
  end

  def searching_screens(dictionary)
    searcher = DictionarySearcher.new(dictionary.file)
    search_results = searcher.choose_search_and_display(ask_for_search_type, ask_for_search_term)
    search_results
  end


  def ask_for_search_type
    choices_display
    gets.chomp.to_i
  end

  def ask_for_search_term
    puts "Enter the search term"
    gets.chomp
  end

  def choices_display
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
  end




end

play = DictionaryUI.new
play.run

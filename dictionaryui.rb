# main class - handles the user interactions loop
require_relative 'dictionary'
require_relative 'dictionary_searcher'
# require_relative 'results_saver'

class DictionaryUI

  def initialize(path='./5desk.txt')
    @path = path
    d = Dictionary.new(path)
    @current_dictionary = d.dictionary_wrap
    @type_of_search = nil
  end


  def run
    puts "Where is your dictionary? ('q' to quit)"
    path = gets.chomp

    if path == 'q'
      exit
    else
      @current_dictionary
    end

    loop do
      puts "What kind of search? (or enter 'q' to quit)"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With"
      puts "4: Ends With"
      @type_of_search = gets.chomp
      case @type_of_search
      when "q"
        exit
      when "1"
        get_search_term
        @search.exact_matches
      when "2"
        get_search_term
        @search.partial_matches
      when "3"
        get_search_term
        @search.begins_with
      when "4"
        get_search_term
        @search.ends_with
      when /[^1-4,q]/
        puts "That is not a valid entry please try again (please enter answer in form 1, 2, 3, 4, or 'q')."
        next
      end   # end of case
      # save_results?
    end
  end   # end of run method

  private

  def get_search_term
    puts "Enter search term:"
    search_term = gets.chomp.upcase
    @search = DictionarySearcher.new(search_term, @current_dictionary)
  end


  def save_results
    puts "***"
    puts "Would you like to save the results? y/n? or 'q' to quit:"
    answer = gets.chomp
  end

end # end of class


nd = DictionaryUI.new
nd.run

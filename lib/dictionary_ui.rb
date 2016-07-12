require 'json'
require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'results_saver'
require_relative 'dictionary_search'

class DictionaryUI
  attr_reader :path
  def initialize(path = 'lib/5desk.txt')
    @path = path
    @new_dictionary = []
    @search = DictionarySearch.new
    @saver = ResultsSaver.new
    @saving = false
  end

  def run
    get_dictionary
    display_dictionary_data
    type = get_search_type
    term = get_search_term
    @search.search(type, @new_dictionary.words, term)
    display_search_results
    if saving?
      file_name = ask_for_filename
      @saver.archive(file_name, @search.results)
    end

    #save it yes, exit if no

  end

  def ask_for_filename
    puts "Please name the file that holds results"
    gets.chomp

  end

  def ask_if_saving
    puts "Do you want to save the search results (y/n)?"
    gets.chomp
    #needs validation
  end

  def saving?
    ask_if_saving == 'y' ? true : false

  end

  def get_search_type
    puts "What search type do you want to perform?"
    puts "Enter: exact, partial, begins_with or ends_with"
    gets.chomp
    #validate
   
  end

  def get_search_term
    puts "Enter a search term"
    gets.chomp
  end

  def display_search_results
    puts "Found #{@search.results.size} matches:"
    @search.results.each {|word| puts word.upcase}
  end

  def get_dictionary
    loop do
      get_file_location

      @new_dictionary = Dictionary.new(@path)
      break unless @new_dictionary.words == []
    end
  end

  def get_file_location
    prompt_user
    get_input
  end

  def prompt_user
    puts "Where is your dictionary? ('q' to quit)"
  end

  def display_dictionary_data
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{@new_dictionary.words.count} words."
    puts "Word frequency by starting letter:"
    @new_dictionary.words_by_letter.each {|key, value| puts "#{key}: #{value}"}
  end

  def get_input
    input = gets.strip
    exit if input == 'q'
    @path=File.join(__dir__, input)
  end
end

d = DictionaryUI.new
d.run
puts

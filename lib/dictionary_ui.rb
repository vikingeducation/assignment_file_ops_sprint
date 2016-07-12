require 'json'
require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'results_saver'

class DictionaryUI
  attr_reader :path
  def initialize(path = 'lib/5desk.txt')
    @path = path
    @new_dictionary = []
    @search = DictionarySearch.new
    @saver = ResultsSaver.new
  end

  def run
    get_dictionary
    display_dictionary_data
    #user input for type of search
    @search.search(type, @new_dictionary, term)
    display_search_results
    #ask_if_save, if yes, ask for name
    @saver.archive(file_name, @results) if saving?

    #save it yes, exit if no

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

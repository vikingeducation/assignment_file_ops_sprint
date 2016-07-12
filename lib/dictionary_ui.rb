require_relative 'dictionary'
require_relative 'dictionary_loader'

class DictionaryUI
  attr_reader :path
  def initialize(path = 'lib/5desk.txt')
    @path = path
    @new_dictionary = []
    @search = DictionarySearch.new
  end

  def run
    get_dictionary
    display_dictionary_data

    #user input for type of search

    display_search_results(type, term)
    #ask_if_save

  end

  def display_search_results(type, term)
    result = DictionarySearch.new.search(type, @new_dictionary, term)
    puts "Found #{result.size} matches"
    result.each {|result| puts result.upcase}
  end

  def get_dictionary
    loop do
      prompt_user
      # get_input
      @new_dictionary = Dictionary.new(@path)
      break unless @new_dictionary.words == []
    end
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

# main class which handles the user interaction loop.
require './dictionary_loader'
require './dictionary_searcher'
require 'pry'

class DictionaryUI
  include DictionaryLoader
  include SearcherFactory

  def run
    request_dictionary_path
    load_dictionary(@path)
    puts "Press 'Enter' to see Stats."
    gets.chomp
    display_stats
    type = request_search_type
    word = request_word
    display_results(type, word, @dictionary)
  end

  private

  @path = ''
  @dictionary = nil

  def request_dictionary_path
    puts "Where is your dictionary? ('q' to quit)"
    puts "ex: path/to/myfile.csv"
    # response = gets.chomp
    response = "./5desk.txt"
    quit?(response)
  end

  def load_dictionary(path)
    @dictionary = DictionaryLoader.create(@path)
    puts '','Dictionary successfully loaded.'
  end

  def display_stats
    puts @dictionary.stats
  end

  def request_search_type
    puts "What kind of search would you like to perform?"
    options = SearcherFactory::SEARCH_OPTIONS

    display_search_type_options(options)
    response = gets.chomp
    until options.keys.include?(response.strip)
      puts "I'm sorry #{response} is not an option."
      display_search_type_options(options)
      response = gets.chomp
    end
    response
  end

  def display_search_type_options(options)
    puts "Enter the number of one of these options:"
    options.each {|num, option| puts "#{num}: #{option}"}
  end

  def request_word
    puts "Enter your word to search:"
    response = gets.chomp.strip
  end

  def display_results(search_type, word, dictionary)
    puts '------------------------------'
    puts "The results for '#{word}' are:"
    results = SearcherFactory.create(search_type, word, dictionary)
    results.find_matches
  end

  def quit?(response)
    if response == 'q'
      exit_program
    else
      @path = response
    end
  end

  def exit_program
    puts "kthxbai"
    exit
  end

end

d = DictionaryUI.new
d.run
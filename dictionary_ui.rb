# main class which handles the user interaction loop.
require './dictionary_loader'
require './dictionary_searcher'
require './results_saver'

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
    save_results
  end

  private

  @path = ''
  @dictionary = nil
  @matches = nil

  def request_dictionary_path
    puts "Where is your dictionary? ('q' to quit)"
    puts "ex: path/to/myfile.csv"
    # response = gets.chomp
    response = "./lib/5desk.txt"
    quit?(response)
    @path = response
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
    quit?(response)
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
    quit?(response)
    response
  end

  def display_results(search_type, word, dictionary)
    puts '------------------------------'
    puts "The results for '#{word}' are:"
    search_results = SearcherFactory.create(search_type, word, dictionary)
    @matches = search_results.find_matches
  end

  def save_results
    puts "Would you like to save these results?  y | n"
    response = gets.chomp.downcase.strip
    quit?(response)
    if response == 'y'
      filename = request_output_file_name
      @permission = true
      request_overwrite_permission if file_exists?(filename)
      if @permission
        puts "Overwriting/writing to file #{filename}..."
        saved_results = ResultsSaver.new(filename, @matches)
        saved_results.generate_file
        puts "Results saved. Check your file."
      else
        puts "placeholder to get intended file name until one is available"
      end
    else
      exit_program
    end
  end

  def request_output_file_name
    puts "What filepath should we write to?"
    puts "ex: results.txt"
    response = gets.chomp
    quit?(response)
    response
  end

  def file_exists?(filename)
    File.exist?(filename)
  end

  def request_overwrite_permission
    puts "This file already exists. Would you like to overwrite it? y | n"
    response = gets.chomp.downcase
    quit?(response)
    if response == 'y'
      @permission = true
    else
      @permission = false
      request_output_file_name
    end
  end

  def quit?(response)
    exit_program if response == 'q'
  end

  def exit_program
    puts "kthxbai"
    exit
  end

end

d = DictionaryUI.new
d.run
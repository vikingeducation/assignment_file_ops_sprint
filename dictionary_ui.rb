# main class which handles the user interaction loop.
require './dictionary_loader'
require 'pry'

class DictionaryUI
  include DictionaryLoader

  def run
    request_dictionary_path
    load_dictionary(@path)
    puts "Press 'Enter' to see Stats."
    gets.chomp
    display_stats
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
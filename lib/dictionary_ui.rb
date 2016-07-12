require_relative 'dictionary_loader'
require_relative 'dictionary'
require_relative 'dictionary_searcher.rb'
require_relative 'results_saver'

#dictionary_ui.rb
class DictionaryUI

  def initialize 
    @results = []
  end

  def run 
    prompt
    # dictionary_path = gets.chomp
    dictionary_path = "5desk.txt"
    @dict = Dictionary.new(dictionary_path)
    
    enter_search

    display_results 

    save_prompt
    save_input = gets.chomp
    save(save_input)
  end

  def save(file_name = "results.txt") 
    ResultsSaver.new(@results).save(file_name)
  end

  def prompt
    puts "Where is your dictionary? ('q' to quit)"
  end

  def enter_search
    puts "Enter your word/phrase: "
    word = gets.chomp.downcase

    puts "Search for words in dictionary that match:"
    puts "exact, partial, begins, ends"
    option = gets.chomp.downcase

    @results = DictionarySearcher.new.search(@dict, word, option)
  end

  def display_results
    puts "#Found #{@results.length} matches."
    puts @results.map{|x| x.upcase}
  end

  def save_prompt 
    puts "Where do you want to save your results?"
  end

end

# puts File.dirname("5desk.txt")
# puts File.expand_path(File.dirname("5desk.txt"))
a = DictionaryUI.new
a.run
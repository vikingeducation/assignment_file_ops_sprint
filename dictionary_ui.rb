require_relative 'dictionary_searcher'
require_relative 'dictionary_loader'
require_relative 'results_saver'

class DictionaryUI

  def initialize
    @dictionary = nil
    @searcher = DictionarySearcher.new
    @result = nil
  end

  def run
    load_dictionary
    check_up
    search_dictionary
    ResultsSaver.save_search @result
  end

  def load_dictionary
    until @dictionary
      path = ask_path
      @dictionary = DictionaryLoader.load(path = "5desk.txt")
    end
  end

  def search_dictionary
    @result = @searcher.search(@dictionary)
    puts "there is #{@result.length} results :"
    @result.each {|result| puts result}
    puts "***"
  end


  def ask_path
    puts "Where is your dictionary? press 'q' to quit "
    path = gets.chomp
    exit if path == "q"
    path
  end

  def check_up
    puts "there is #{@dictionary.length} words in the dictionary"
    puts "Word by first letter frequency :"
    letter_counting.each {|letter, count| puts "#{letter} : #{count}"}
  end

  def letter_counting
    hash = @dictionary.inject(Hash.new(0)) do |hash, word|
      hash[word[0]] += 1 ; hash
    end
    hash
  end
end


d = DictionaryUI.new
d.run
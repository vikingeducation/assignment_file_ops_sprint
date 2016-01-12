require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  attr_reader :dictionary, :searcher

  def initialize
    @dictionary = nil
    @searcher = nil
  end

  def run
    load_dictionary
    puts
    search
  end

  def load_dictionary
    until @dictionary
      puts "# Where is your dictionary? ('q' to quit)"
      input = gets.chomp
      return if input == 'q'
      @dictionary = DictionaryLoader.load(input)
      @searcher = DictionarySearcher.new(@dictionary)
    end
  end

  def search
    puts "# What kind of search?"
    puts "# 1: Exact"
    puts "# 2: Partial"
    puts "# 3: Begins With"
    puts "# 4: Ends With"
    input = gets.chomp

    return if input == 'q'
    search unless (1..4) === input.to_i

    case input
    when '1'
      exact_match
    when '2'
      partial_match
    when '3'
      begins_with
    when '4'
      ends_with
    end
  end

  def get_search_term
    puts "# Enter search term"
    term = gets.chomp
  end

  def exact_match
    word = get_search_term
    results = searcher.exact_match(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
  end

  def partial_match
    word = get_search_term
    results = searcher.partial_match(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
  end

  def begins_with
    word = get_search_term
    results = searcher.begins_with(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
  end

  def ends_with
    word = get_search_term
    results = searcher.ends_with(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
  end
end

DictionaryUI.new.run

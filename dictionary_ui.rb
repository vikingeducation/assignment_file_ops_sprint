require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  attr_reader :dictionary, :searcher

  def initialize
    @dictionary = nil
    @searcher = nil
    @result = nil
  end

  def run
    load_dictionary
    puts
    loop do
      search
      ask_for_save
    end
  end

  def load_dictionary
    until @dictionary
      puts "# Where is your dictionary? ('q' to quit)"
      input = gets.chomp
      exit if input == 'q'
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

    exit if input == 'q'
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
    gets.chomp
  end

  def ask_for_save
    puts "# Do you want to save your results? y/n? 'q' quits"
    save = gets.chomp

    case save
    when /^y/
      save_results
    when /^n/
      search
    when /^q/
      exit
    else
      ask_for_save
    end
  end

  def save_results
    puts "# What file path should we write results to? "
    file = gets.chomp
    overwrite = false
    if File.exists?(file)
      puts "# That file exists. Overwrite? y/n?"
      answer = gets.chomp
      case answer
      when /^n/
        save_results
      end
      overwrite = true
    end

    file_saver = ResultsSaver.new(@result, file)
    file_saver.save
    if overwrite
      puts "File successfully overwritten"
    else
      puts "File successfully saved"
    end
  end

  def exact_match
    word = get_search_term
    results = searcher.exact_match(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
    @result = results
  end

  def partial_match
    word = get_search_term
    results = searcher.partial_match(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
    @result = results
  end

  def begins_with
    word = get_search_term
    results = searcher.begins_with(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
    @result = results
  end

  def ends_with
    word = get_search_term
    results = searcher.ends_with(word)
    puts "Found #{results.size} matches:"
    results.each do |result|
      puts result.upcase
    end
    @result = results
  end
end

DictionaryUI.new.run

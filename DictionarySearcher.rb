# DictionarySearcher.rb
require_relative 'Dictionary'
require 'pathname'

class DictionarySearcher
  def initialize(dictionary)
    @dictionary = dictionary
    @results = []
  end

  def run_search
    puts 'What kind of search?'
    # puts @dictionary.length.to_s
    puts '1: Exact'
    puts '2: Partial'
    puts '3: Begins With'
    puts '4: Ends With'
    search_option = gets.chomp.to_i
    puts 'Enter search term:'
    search_term = gets.chomp.upcase
    select_search(search_option, search_term)
  end

  def select_search(option, term)
    results = []
    @dictionary.words.each do |word|
      case option
      when 2
        results.push(word) unless word.upcase.index(term).nil?
      when 3
        results.push(word) if word.upcase.start_with?(term)
      when 4
        results.push(word) if word.upcase.end?(term)
      else
        results.push(word) if word.upcase == term
      end
    end
    show_results(results)
  end

  def show_results(results)
    puts "#{results.length} results found."
    results.each do |word|
      puts word
    end
    save_results(results)
  end

  def save_results(results)
    # should be ResultsSaver...
    puts "Would you like to save the results to a file? y/n? 'q' quits"
    save_file = gets.chomp.to_s
    return unless save_file == 'y'
    puts 'What file path should I write the file to?'
    path = gets.chomp.to_s
    pn = Pathname.new(path)
    if pn.exist?
      puts "That file exists, overwrite? y/n? 'q' quits"
      ow_file = gets.chomp.to_s
      return unless ow_file == 'y'
    end
    puts 'write file....'
    open(pn, 'w') do |f|
      results.each do |word|
        f.puts word
      end
    end
  end
end

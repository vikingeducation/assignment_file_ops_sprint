require 'yaml'
require_relative 'dictionaryloader'
require_relative 'dictionaryanalyzer'

class Dictionary 
  attr_accessor :dictionary, :words, :dictionary_string, :dictionaryloader, :dictionaryanalyzer, :results

  def initialize
    @dictionaryloader = DictionaryLoader.new
    prompt_file
    @dictionaryanalyzer = DictionaryAnalyzer.new(@words)
  end

  # main script function
  def start
    display_stats
    loop do
      search
      prompt_save_or_puts
      puts "Enter 'y' to make another search or anything else to quit."
      break if gets.chomp != 'y'
    end
  end

  def search
    modes = ["exactly match", "partially match", "begin with", "end with"]

    puts "What type of search would you like to make? Enter:
    '1' for exact match
    '2' for partial match
    '3' for begins with
    '4' for ends with"
    mode = gets.chomp.to_i
    
    puts "Search for the words that #{modes[mode-1]}: "
    input = gets.chomp
    to_break = false
    case mode
    when 1
      search_exact(input)
    when 2
      search_partial(input)
    when 3
      search_begins_with(input)
    when 4
      search_ends_with(input)
    end

    puts "There were #{@results.size} matches." if !@results.nil?
  end

  def search_exact(input)
    regex = /\b#{input}\b/i
    puts @dictionary_string[0..40]
    @results = @dictionary_string.scan(regex)
  end

  def search_partial(input)
    regex = /\b\w*#{input}\w*\b/i #is \b necessary? or does \w imply \b
    @results = @dictionary_string.scan(regex)
  end

  def search_begins_with(input)
    regex = /#{input}\w+/i
    @results = @dictionary_string.scan(regex)
  end

  def search_ends_with(input)
    regex = /\w*#{input}\b/i
    @results = @dictionary_string.scan(regex)
  end

  def prompt_file
    loop do
      puts "Enter the file path of the dictionary: "
      path = gets.chomp
      if File.exist?(path)
        @dictionary = @dictionaryloader.load(path)
        @words = @dictionary.readlines
        @dictionary_string = @words.join
        break
      else
        puts "Invalid file path, try again."
      end
    end
  end

  def save_search_to_file
    File.open("search_results.txt","w") do |file|
      file.write @results
    end
  end

  def prompt_save_or_puts
    loop do
      puts "Do you wish to save the search results to a file or just display them? ('s','d'): "
      ans = gets.chomp
      if ans == 's'
        if File.exist?("search_results.txt")
          puts "A file already exists, overwrite? ('y'/'n')" 
          save_search_to_file if gets.chomp == 'y'
        else
          save_search_to_file
        end
        break
      elsif ans == 'd'
        puts @results
        break
      else
        puts "Invalid input, try again."
      end
    end
  end

  def display_stats
    word_count = @dictionaryanalyzer.word_count
    each_letter_word_count = @dictionaryanalyzer.each_letter_word_count

    puts "This dictionary has #{word_count} words. 
    The number of words starting with each letter is: #{each_letter_word_count}";
  end
end
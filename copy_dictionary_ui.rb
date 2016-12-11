# require 'dictionary_loader'
# require 'dictionary'
# require 'dictionary_searcher'
# require 'results_saver'


class DictionaryUI

  def run
    loop do
      puts "Where is your dictionary? ('q' to quit)"
      file_location = gets.chomp
      break if file_location == 'q'
      dictionary = Dictionary.new(file_location)
      puts "Dictionary successfully loaded" if dictionary != nil
      puts "Your dictionary contains #{dictionary.word_count} words."
      puts "Word frequency by starting letter:"
      dictionary.display_words_by_numbers
      searcher = DictionarySearcher.new(dictionary)
      searcher.choose_search_and_display
    end
  end

end

class DictionaryLoader
  attr_accessor :file_location

  def initialize(file_location)
    @file_location = file_location
  end

  def load
    arr = []
    File.readlines(@file_location) do |line|
      arr << line.strip
    end
  end

end

class Dictionary
  attr_accessor :file

  def initialize(file)
    @file = DictionaryLoader.new(file).load
  end

  def word_count
    @file.size
  end

  def words_count_by_first_letter
    words_frequency = {}
    alphabet = "ABCDEFGHIJKLMNOPQRSTWXYZ".split("")
    alphabet.each do |letter|
      counter = 0
      @file.each {|word| counter += 1 if word[0] == letter }
      words_frequency[letter] = counter
    end
    words_frequency
  end

  def display_words_by_numbers
    words_count_by_first_letter.each{|key, value| puts "#{key}: #{value}"}
  end

end

class DictionarySearcher
  
  def initialize(file)
    @file = file
  end

  def choices_display
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
  end

  def ask_for_search_type
    choices_display
    gets.chomp.to_i
  end

  def ask_for_search_term
    gets.chomp
  end

  def choose_search_and_display
    search_type = ask_for_search_type
    term = ask_for_search_term
    case search_type
      when 1
        exact_match(term)
      when 2
        partial_match(term)
      when 3
        begins_with_match(term)
      when 4
        ends_with_match(term)
    end
  end

  def find_and_display(user_input)
    regex = %r[#{user_input}]
    result = @file.join(" ").scan(regex)
    print "Found #{result.size} match"
    print "es /n" if result.size > 1
    result.each {|word| puts "#{word}"}
  end

  def exact_match(user_input)
    find_and_display(user_input)
  end

  def partial_match(user_input)
    user_input = user_input + ".*\s+"
    find_and_display(user_input)
  end

  def begins_with_match(user_input)
    user_input = user_input + ".*\s+"
    find_and_display(user_input)
  end

  def ends_with_match(user_input)
    user_input = ".?" + user_input + "\s+"
    find_and_display(user_input)
  end

end

class ResultsSaver

end
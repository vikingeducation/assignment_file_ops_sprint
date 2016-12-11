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

      puts "What kind of search?"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With"
      puts "4: Ends With"


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
  #return the DictionaryLoader file

  def exact_match(word)

  end


end

class ResultsSaver

end
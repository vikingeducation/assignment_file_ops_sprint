require_relative 'dictionary_loader'

#dictionary.rb
class Dictionary
  attr_reader :words

  def initialize(path)
    @words = DictionaryLoader.new.load(path)
  end

  def print_stats
    puts "There are #{@words.length} words in this dictionary."
    puts "Word frequency by starting letter:"

    letters = Array('A'..'Z')
    word_counts = []
    letters.each do |letter| 
      word_counts << @words.index(letter)
    end

    Array('A'..'Z').each_with_index do |letter, index|
      word_count = (word_counts[index + 1] || @words.length) - word_counts[index]

      puts "#{letter}: #{word_count}"
    end
    
  end 

end
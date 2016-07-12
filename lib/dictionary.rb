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

    

    # Array('A'..'Z').each 
    # capital of each letter will be break point, that index -1 is previous letter's word count
    # subtract word count of each previous letter off of it too

    Array('A'..'Z').each do |letter|

      puts "#{letter}: #{letter_count}"
    end
  end 

end
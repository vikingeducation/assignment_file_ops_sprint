require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'

class Dictionary
  attr_reader :dictionary
  
  def initialize
    @dictionary = DictionaryLoader.new.dictionary
    run
  end

  def run
    puts "Dictionary succesfully loaded"
    puts "Your dictionary containts #{@dictionary.size} words"
    puts "Word frequency by starting letter:"
    display_word_count
  end

  def display_word_count
    ("a".."z").each do |letter|
      puts "#{letter}: #{@dictionary.count{|word| word[0].downcase == letter}}"
    end
  end

end
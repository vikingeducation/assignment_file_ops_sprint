require_relative 'dictionary_loader'

class Dictionary
  attr_reader :words
  def initialize(path)
    @words = DictionaryLoader.new(path).dictionary
  end

  def word_count
    @words.size
  end

  def words_by_letter
    result = {}
    "A".upto("Z") { |letter| result[letter] = 0 }
    
    @words.each do |word| 

      result[word[0].upcase] += 1 
    end
    result

  end
end

a = Dictionary.new('5desk.txt')
p a.words_by_letter

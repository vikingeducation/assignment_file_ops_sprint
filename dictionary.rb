class Dictionary

  attr_accessor :dict
  def initialize
    @dict = DictionaryLoader.new.dictionary
  end

end

class DictionaryLoader

  attr_accessor :dictionary
  def initialize(filename="5desk.txt")
    @dictionary = File.readlines(filename)
    @dictionary.map! {|word| word.chomp}
  end
end

class DictionaryAnalyzer

  def initialize(dict)
    @dict = dict
  end

  # Word count
  # Word count of each first letter

  def word_count
    @dict.length
  end

  def first_letter_word_count(letter)
    @dict.select{|word| word[0].downcase == letter.downcase}.length
  end

  def exact_match(word)
    return true if @dict.include?(word) || @dict.include?(word.downcase)
    return false
  end

end

dict = DictionaryAnalyzer.new(Dictionary.new.dict)
puts dict.first_letter_word_count("a")
puts dict.word_count
puts dict.exact_match("aqua")
puts dict.exact_match("aquas")
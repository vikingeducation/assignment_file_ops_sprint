require_relative "dictionary_loader.rb"

class DictionarySearcher

  def initialize
    @loader = DictionaryLoader.new('smaller.txt')
  end

  # def user_match(user_word)
  #   if user_word == "X"
  #     exact
  # end

  def exact_match(user_word)
    @loader.arr.each do |word|
      return word if word == user_word
    end
  end

  def partial_match(user_word)
    partials = []
    @loader.arr.each do |word|
      partials << word if word.include?(user_word) || user_word.include?(word)
    end
    print partials
  end
  
end

ds = DictionarySearcher.new
# ds.exact_match("AB")
ds.partial_match("ABA")
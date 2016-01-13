require_relative "dictionary_loader.rb"

class DictionarySearcher

  def initialize
    @loader = DictionaryLoader.new('smaller.txt')
  end

  def find_matches(user_search_type, user_word)
    if user_search_type == 1
      exact_match(user_word)
    elsif user_search_type == 2
      partial_match(user_word)
    elsif user_search_type == 3
      it_begins_with(user_word)
    else
      it_ends_with(user_word)
    end
  end


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
    partials
  end


  def it_begins_with(user_word)
    begins_with = []
    length = user_word.length
    @loader.arr.each do |word|
      begins_with << word if word[0...length] == user_word
    end
    begins_with
  end

  def it_ends_with(user_word)
    ends_with = []
    length = user_word.length
    @loader.arr.each do |word|
      ends_with << word if word[-length..-1] == user_word
    end
    ends_with
  end

  
end

# ds = DictionarySearcher.new
# ds.exact_match("AB")
# print ds.partial_match("AND")
# ds.it_ends_with("ON")
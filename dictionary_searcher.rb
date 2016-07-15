require_relative 'dictionary'



class DictionarySearcher

  def initialize(dictionary)
    @dictionary = dictionary
  end

 
  #case-sensitive
  def exact_matches(search_term)
    @dictionary.select {|word| word == search_term}
  end

  #case-sensitive
  def partial_matches(search_term)
    @dictionary.select {|word| word.chars.join.include?(search_term.chars.join)}
  end

  #case-sensitive
  def begins_with_matches(search_term)
    dictionary = []
    @dictionary.select {|word| /\A#{search_term}/ =~ word}
  end

  #case-sensitive
  def ends_with_matches(search_term)
    @dictionary.select {|word| /#{search_term}\z/ =~ word}
  end




end

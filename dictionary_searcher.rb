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
    @dictionary.select {|word| word.start_with?(search_term)}
  end

  #case-sensitive
  def ends_with_matches(search_term)
    @dictionary.select {|word| word.end_with?(search_term)}
  end




end

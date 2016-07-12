require_relative 'dictionary'

class DictionarySearcher

  def initialize(dictionary)
    @dictionary = dictionary.dictionary
  end

  def display_matches(array)
    puts array
  end

  def exact_matches(search_term)
    @dictionary.select {|word| word.downcase == search_term}
  end

  def partial_matches(search_term)
    @dictionary.select {|word| word.chars.join.include?(search_term.chars.join)}
  end

  def begins_with_matches(search_term)
    @dictionary.select {|word| word.start_with?(search_term)}
  end

  def ends_with_matches(search_term)
    @dictionary.select {|word| word.end_with?(search_term)}
  end




end

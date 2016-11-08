# DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.

class DictionarySearcher

  attr_accessor :dictionary_file

  def initialize(dictionary_file)
    @dictionary_file = dictionary_file
  end

  def which_match(choice, search_term)
    case choice
    when "1" 
      exact_match(search_term)
    when "2"
      partial_match
    when "3" 
      begins_with
    when "4"
      ends_with
    end
  end

  def exact_match(search_term)
    binding.pry
    @dictionary_file.select do |word|
      word.include?(search_term)
    end
  end  

end
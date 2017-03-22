class DictionarySearcher
  attr_reader :dictionary
  
  def initialize(dictionary = nil)
    @dictionary = dictionary
  end

  def exact_matches(search_term)
    result = []
    result << search_term if dictionary.words.include?(search_term)
    
    result
  end

  def partial_matches(search_term)
    result = []
    dictionary.words.each do |word|
      result << word if word.match(/#{search_term}/)
    end
    
    result
  end
end
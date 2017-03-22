class DictionarySearcher
  attr_reader :dictionary
  
  def initialize(dictionary = nil)
    @dictionary = dictionary
  end

  def exact_matches(word)
    result = []
    result << word if dictionary.words.include?(word)
    result
  end
end
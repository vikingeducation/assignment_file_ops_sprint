class DictionarySearcher
  attr_reader :dictionary
  
  def initialize(dictionary = nil)
    @dictionary = dictionary
  end
end
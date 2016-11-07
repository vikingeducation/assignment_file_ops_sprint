class DictionarySearcher
  attr_reader :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def word_count
    dictionary.words.count
  end

  def word_frequency_by_letter
    dictionary.words.group_by{ |w| w[0] }
  end

end
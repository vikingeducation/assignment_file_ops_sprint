class DictionarySearcher

  attr_reader :dictionary, :dictionary_length, :midpoint

  def initialize(args = {})
    @dictionary = args[:dictionary]
  end

  def dictionary=(dictionary)
    @dictionary_length = dictionary.words.length
    @dictionary = dictionary
  end

  def exact_match(term, search_area = dictionary.words)
    midpoint = search_area.length / 2
    possible_match = search_area[midpoint]
    if possible_match == term
      possible_match
    elsif possible_match > term
      exact_match(term, search_area[0...midpoint])
    else
      exact_match(term, search_area[(midpoint + 1)..-1])
    end
  end

  def partial_match(term)
    dictionary.select { |word| word.include?(term) }
  end

  def begins_match(term)
    dictionary.select { |word| word.start_with?(term) }
  end

  def ends_match(term)
    dictionary.select { |word| word.ends_with?(term) }
  end

end

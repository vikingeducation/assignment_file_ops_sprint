class DictionarySearcher

  attr_accessor :dictionary, :unknown_search_type_message

  def initialize(args = {})
    @dictionary = args[:dictionary]
    @unknown_search_type_message = "Search type not known."
  end

  def search(user_input)
    type, term = user_input.split(" ")
    search_type = "#{type}_match"
    return unknown_search_type_message unless respond_to?(search_type)
    public_send(search_type, term)
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

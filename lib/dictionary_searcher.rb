class DictionarySearcher
  attr_reader :dictionary

  def initialize( dictionary )
    @dictionary = dictionary
  end

  def word_count
    dictionary.words.count
  end

  def word_frequency_by_letter
    word_hash = dictionary.words.group_by{ |w| w[0] }
    frequencies = {}
    word_hash.each do |letter, words|
      frequencies[letter] = words.count
    end
    frequencies
  end

  def parse_input(search_choice, search_term)
    case search_choice
    when 1 then exact_search(search_term)
    when 2 then partial_search(search_term)
    when 3 then begins_with(search_term)
    when 4 then ends_with(search_term)
    end
  end

  def exact_search(search_term)
    dictionary.words.include?(search_term)
  end

  def partial_search(search_term)
    matches = []
    dictionary.words.each do |word|
      matches << word if word.include?(search_term)
    end
    matches
  end

  def begins_with(search_term)
    matches = []
    dictionary.words.each do |word|
      matches << word if word.start_with?(search_term)
    end
    matches
  end

end

class DictionarySearcher

  def self.quick_stats(dictionary_array)
    num_of_words = dictionary_array.length
    frequencies_hash = {}
    dictionary_array.each do |word|
      frequencies_hash[word[0].upcase] += 1
    end
    [num_of_words, frequencies_hash]
  end

  def self.exact?(word)
    dictionary_array.include?(word)
  end

  def partial(word)
    match_array = []
    dictionary_array.each do |dictionary_word|
      if dictionary_word.include?(word)
        match_array << dictionary_word
      end
    end
    match_array
  end

  def begins_with(word)
    match_array = []
    regex = /^#{word}/i
    dictionary_array.each do |dictionary_word|
      if regex =~ dictionary_word != nil
        match_array << dictionary_word
      end
    end
    match_array
  end

  def ends_with(word)
    match_array = []
    regex = /#{word}$/i
    dictionary_array.each do |dictionary_word|
      if regex =~ dictionary_word != nil
        match_array << dictionary_word
      end
    end
    match_array
  end

end

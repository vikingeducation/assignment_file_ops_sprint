class DictionarySearcher

  def self.quick_stats(dictionary_array)
    num_of_words = dictionary_array.length
    frequencies_hash = Hash.new(0)
    dictionary_array.each do |word|
      frequencies_hash[word[0].upcase] += 1
    end
    [num_of_words, frequencies_hash]
  end

  def self.exact?(word, dictionary_array)
    dictionary_array.include?(word)
  end

  def self.partial(word, dictionary_array)
    match_array = []
    dictionary_array.each do |dictionary_word|
      if dictionary_word.include?(word)
        match_array << dictionary_word
      end
    end
    match_array
  end

  def self.begins_with(word, dictionary_array)
    match_array = []
    regex = /^#{word}/i
    dictionary_array.each do |dictionary_word|
      if (regex =~ dictionary_word) != nil
        match_array << dictionary_word
      end
    end
    match_array
  end

  def self.ends_with(word, dictionary_array)
    match_array = []
    regex = /#{word}$/i
    dictionary_array.each do |dictionary_word|
      if (regex =~ dictionary_word) != nil
        match_array << dictionary_word
      end
    end
    match_array
  end

end

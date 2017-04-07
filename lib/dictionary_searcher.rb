class DictionarySearcher
  def exact_match(word_to_find, dictionary)
    found_word = []

    dictionary.each do |word|
      found_word << word if word_to_find.casecmp(word.downcase).zero?
    end

    found_word.empty? ? nil : found_word
  end

  def partial_match(word_to_find, dictionary)
    found_words = nil

    found_words = dictionary.select { |word| word.downcase.include? word_to_find.downcase }

    found_words
  end

  def begins_with_match(word_to_find, dictionary)
    found_words = nil

    found_words = dictionary.select { |word| word.downcase =~ /^#{word_to_find.downcase}.+/ }

    found_words
  end

  def ends_with_match(word_to_find, dictionary)
    found_words = nil

    found_words = dictionary.select { |word| word.downcase =~ /.+#{word_to_find.downcase}$/ }

    found_words
  end
end

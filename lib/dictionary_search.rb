class DictionarySearch

  def exact(dictionary, word)
    dictionary.select { |dictionary_word| word == dictionary_word }
  end

  def partial(dictionary, word)
    dictionary.select { |dictionary_word| dictionary_word.include? word}
  end

  def begins_with(dictionary, word)
    dictionary.select { |dictionary_word| dictionary_word =~ /^#{word}/ }
  end

  def ends_with(dictionary, word)
    dictionary.select { |dictionary_word| dictionary_word =~ /#{word}$/}
  end

end

puts DictionarySearch.new.exact(["find", "notfind"], "find")

puts DictionarySearch.new.partial(["find", "notfind"], "in")

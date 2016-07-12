class DictionarySearch

  def search(type, dictionary, word)
    send(type.to_sym, dictionary, word)
  end

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



 p DictionarySearch.new.search('exact',["find", "notfind"], "find")

# p DictionarySearch.new.partial(["find", "notfind"], "in")

# p DictionarySearch.new.begins_with(["find", "notfind"], "fi")

# p DictionarySearch.new.ends_with(["find", "notfind"], "ind")



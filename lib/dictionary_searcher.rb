class DictionarySearcher

  def search(dictionary, word, option)
    send(option.to_sym, dictionary, word)
  end

  def exact(dictionary, word)
    dictionary.words.select { |x| x == word }
  end

  def begins(dictionary, word)
    dictionary.words.select { |x| x=~ /\A#{word}/ }
  end

  def ends(dictionary, word)
    dictionary.words.select { |x| x=~ /#{word}$/ }
  end

  def partial(dictionary, word)
    dictionary.words.select { |x| x=~ /#{word}/ }

  end


end
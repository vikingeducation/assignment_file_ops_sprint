class DictionarySearcher

  def search(dictionary, word, option)
    send(option.to_sym, dictionary, word)
  end

  def exact(dictionary, word)
    dictionary.words.select { |x| x == word }
  end

  def begins(dictionary, word)
    dictionary.words.select { |x| /\A[#{word}]/}
  end

  def ends
    
  end

  def partial

  end


end
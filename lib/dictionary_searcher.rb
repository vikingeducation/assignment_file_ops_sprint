class DictionarySearcher

  def search(dictionary, chars, choice)
    send(choice.to_sym, dictionary, chars)
  end

  def exact

  end

  def begins

  end

  def ends
    
  end

  def partial

  end


end
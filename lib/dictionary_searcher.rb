class DictionarySearcher

  def search(dictionary, string, choice)
    #@method_hash[choice.to_sym].call(dictionary, string)
    send(choice.to_sym, dictionary, string)
  end

  def exact(dictionary, string)
    dictionary.select { |word| word == string }
  end

  def partial(dictionary, string)
    dictionary.select { |word| word[string] }
  end

  def begins(dictionary, string)
    dictionary.select { |word| word[/^#{string}/] }

  end

  def ends(dictionary, string)
    dictionary.select { |word| word[/#{string}$/] }
  end


end

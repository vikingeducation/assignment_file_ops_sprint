class DictionarySearcher

  def search(dictionary, string)
    dictionary.select {|word| word == string}
  end

end
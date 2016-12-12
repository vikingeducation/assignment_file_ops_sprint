class DictionarySearcher

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def exact(term)
    @dictionary.select {|word| word == term}
  end

  def partial(term)
    @dictionary.select {|word| word.include?(term)}
  end

  def begins_with(term)
    @dictionary.select {|word| word.start_with?(term)}
  end

  def ends_with(term)
    @dictionary.select {|word| word.end_with?(term)}
  end
end
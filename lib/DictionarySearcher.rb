#DictionarySearcher
class DictionarySearcher

  def initialize(dictionary)
    @dict=dictionary
  end

  def exact_matches(query)
    @dict.select{|word| word.downcase==query.downcase}
  end

  def partial_matches(query)
    @dict.select{|word| /#{query.downcase}/.match(word.downcase)}
  end

  def begins_with_matches
  end

  def ends_with_matches
  end
end
# DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.

class DictionarySearcher
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def exact_match
    nil
  end

  def partial_match
    nil
  end

  def begins_with
    nil
  end

  def ends_with
    nil
  end
end
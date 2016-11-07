class DictionarySearcher

  def initialize(words)
    @words = words
  end

  def exact_matches(input)
    return input if @words.include?(input)
  end

  def partial_matches(input)
    matches(input)
  end

  def begins_with(input)
    matches("\A" + input)
  end

  def ends_with(input)
    matches(input + "\z")
  end

  def matches(regex)
    return_words = []
    @words.each do | word |
      if word.match(/regex/)
        return_words << word
      end
    end
    return_words
  end

end

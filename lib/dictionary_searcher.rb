class DictionarySearcher

  def initialize(words)
    @words = words
  end

  def exact_matches(input)
    return input if @words.include?(input)
  end

  def partial_matches(input)
    @words.select{ |word| word.include?(input) }
  end

  def begins_with(input)
    # matches("\A" + input)
    @words.select{ |word| word.start_with?(input) }
  end

  def ends_with(input)
    # matches(input + "\z")
    @words.select{ |word| word.end_with?(input) }
  end

  # def matches(input)
  #   return_words = []
  #   @words.each do | word |
  #     if word.match(Regexp.new(input))
  #       return_words << word
  #     end
  #   end
  #   return_words
  # end

end

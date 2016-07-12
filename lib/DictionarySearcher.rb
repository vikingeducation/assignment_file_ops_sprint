class DictionarySearcher

  def initialize
    @method_hash = { exact: method(:exact),
                     partial: method(:partial),
                     be: method(:begins_and_ends) }
  end

  def search(dictionary, string, choice)
    @method_hash[choice.to_sym].call(dictionary, string)
  end

  def exact(dictionary, string)
    dictionary.select { |word| word == string }
  end

  def partial(dictionary, string)
    dictionary.select do |word|
      
    end
  end

  def begins_and_ends
  end


end

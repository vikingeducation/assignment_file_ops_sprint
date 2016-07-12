class DictionarySearcher

  def initialize
    @method_hash = { exact: method(:exact),
                     partial: method(:partial),
                     begins: method(:begins_with),
                     ends: method(:ends_with)      }
  end

  def search(dictionary, string, choice)
    @method_hash[choice.to_sym].call(dictionary, string)
  end

  def exact(dictionary, string)
    dictionary.select { |word| word == string }
  end

  def partial(dictionary, string)
    dictionary.select { |word| word[string] }
  end

  def begins_with(dictionary, string)
    dictionary.select { |word| word[/^#{string}/] }

  end

  def ends_with(dictionary, string)
    dictionary.select { |word| word[/#{string}$/] }
  end


end

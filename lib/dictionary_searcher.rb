# finds matches in Dictionary
class DictionarySearcher
  #Exact matches
  class << self

    def exact_match(dict, search)
      dict.words.select{ |word| word == search }
    end

  #Partial matches
    def partial_match(dict, search)
      dict.words.select{ |word| /#{search}/i.match(word)}
    end

  #Begins_with
    def begins_with(dict, search)
      dict.words.select{ |word| /\A#{search}/i.match(word)}
    end

    def first_letter(dict, search)
      dict.words.select { |word| word[0].downcase == search.downcase }
    end

  #Ends_with
    def ends_with(dict, search)
      dict.words.select{ |word| /#{search}\z/i.match(word)}
    end

  end



end
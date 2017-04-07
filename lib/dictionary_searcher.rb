class DictionarySearcher
  # attr_accessor :word
  #
  # def initialize(word_to_search = nil)
  #   @word = word_to_search
  # end

  def exact_match(word_to_find, dictionary)
    found_word = nil

    dictionary.each do |word|
      found_word = word if word_to_find.downcase == word.downcase
    end

    return found_word
  end
end

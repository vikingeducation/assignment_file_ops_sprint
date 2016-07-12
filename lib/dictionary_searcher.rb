# dictionary_searcher.rb

class DictionarySearcher

  def self.exact_match(dictionary, search_expression)
    dictionary.find { |word| word == search_expression }
  end
end


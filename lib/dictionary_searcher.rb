# dictionary_searcher.rb

class DictionarySearcher

  def self.exact_match(dictionary, search_expression)
    dictionary.find do |word|
      word.downcase == search_expression.downcase
    end
  end

  def self.partial_match(dictionary, search_expression)
    dictionary.find_all do |word|
      word.downcase.include?(search_expression.downcase)
    end
  end

  def self.begins_with(dictionary, search_expression)
    dictionary.find_all do |word|
      word.downcase.start_with?(search_expression.downcase)
    end
  end

  def self.ends_with(dictionary, search_expression)
    dictionary.find_all do |word|
      word.downcase.end_with?(search_expression.downcase)
    end
  end

end



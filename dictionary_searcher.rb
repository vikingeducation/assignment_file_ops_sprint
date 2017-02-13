
class DictionarySearcher

  attr_reader :matches

  def initialize(dictionary, type_of_search, search_term)
    @dictionary = dictionary
    @type = type_of_search
    @search_term = search_term
    @matches = []
  end

  def search
    @dictionary.words.each do |word|
      case @type
      when 1
        @matches << word if exact_matches?(word)
      when 2
        @matches << word if partial_matches?(word)
      when 3
        @matches << word if begins_with?(word)
      when 4
        @matches << word if ends_with?(word)
      end
    end
    puts "Found #{@matches.size} matches:"
    @matches.each do |match|
      puts match.upcase
    end
    puts "*" * 4
  end

  private

  def exact_matches?(word)
    word.match(/^#{@search_term}$/)
  end

  def partial_matches?(word)
    word.match(/.*#{@search_term}.*/)
  end

  def begins_with?(word)
    word.match(/^#{@search_term}.*/)
  end

  def ends_with?(word)
    word.match(/.*#{@search_term}$/)
  end

end
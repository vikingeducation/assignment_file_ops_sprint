
=begin
 DictionarySearcher is an analysis class whose sole responsibility is to
 perform any analysis on the dictionary you provide it.
=end

class DictionarySearcher
  attr_reader :results

  def initialize(dictionary, type, term)
    @dictionary = dictionary
    @term = term
    @results = []
    route(type)
  end

  def route(search_type)
    case search_type
    when "1"
      exact
    when "2"
      partial
    when "3"
      begins
    when "4"
      ends
    end
  end

  def exact
    @dictionary.each do |word|
      @results << word if word == @term
    end
  end

  def partial
    @dictionary.each do |word|
      @results << word if word.include?(@term)
    end
  end

  def begins
    @dictionary.each do |word|
      @results << word if word[0...@term.length] == @term
    end
  end

  def ends
    @dictionary.each do |word|
      if @term.length == 1
        @results << word if word[-1] == @term[-1]
      else
        @results << word if word[-@term.length..-1] == @term
      end
    end
  end
end

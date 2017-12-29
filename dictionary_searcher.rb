
=begin
 DictionarySearcher is an analysis class whose sole responsibility is to
 perform any analysis on the dictionary you provide it.
=end

class DictionarySearcher
  attr_reader :results

  def initialize(dictionary, type, term)
    @dictionary = dictionary
    @type = type
    @term = term
    @results = []
    analyze
  end

=begin
  TODO
  1. begins and ends should work for multiple letters
  2. partial should try to find x amount of matching letters in the same
  order in a given word
=end

  def analyze
    @dictionary.each do |word|
      if @type == "1" # exact
        results << word if word == @term
      elsif @type == "2" # partial
        results << word if word[0...@term.length] == @term
      elsif @type == "3" # begins
        results << word if word[0] == @term[0]
      else @type == "4" # ends
        results << word if word[-1] == @term[-1]
      end
    end
  end

end

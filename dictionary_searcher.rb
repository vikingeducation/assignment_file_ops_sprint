
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
  2. partial should try to find x amount of matching letters in the same
  order in a given word/maybe just find some of the same letters?
=end

  def analyze
    @dictionary.each do |word|
      if @type == "1" # exact
        results << word if word == @term
      elsif @type == "2" # partial
        results << word if word[0...@term.length] == @term
      elsif @type == "3" # begins
        results << word if word[0...@term.length] == @term
      else @type == "4" # ends
        if @term.length == 1
          results << word if word[-1] == @term[-1]
        else
          results << word if word[-@term.length..-1] == @term
        end
      end
    end
  end

end

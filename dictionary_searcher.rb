
=begin
 DictionarySearcher is an analysis class whose sole responsibility is to
 perform any analysis on the dictionary you provide it.
=end

class DictionarySearcher
  def initialize(dictionary, type, term)
    @dictionary = dictionary
    @type = type
    @term = term
    analyze
  end

  def analyze
    results = []
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

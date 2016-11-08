#DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.

class DictionarySearcher

  def which_match(input, word)
    case input
    when 1 
      exact_match(word)
    when 2
      partial_match
    when 3 
      begins_with
    when 4
      ends_with
    end
  end

  def exact_match(search_string)
# display the number of matches
# display the matches
    regex = /#{search_string}/
    @match_array = @dictionary.file.scan(regex)
    @number_of_matches = match_array.length

  end  

end
#DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.

class DictionarySearcher


  def which_match(input, word, dictionary)
    puts "I'm running which match!"
    puts "#{input}: #{word}"
    case input
    when "1" 
      exact_match(word, dictionary)
    when "2"
      partial_match
    when "3" 
      begins_with
    when "4"
      ends_with
    end
  end

  def exact_match(search_string, dictionary)
    puts "exact_match!"
    regex = /#{search_string}/
    match_array = dictionary.file.scan(regex)
    puts match_array
  end  

end
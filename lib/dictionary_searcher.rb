# DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.


require_relative 'dictionary'

# Find a way to make dictionary know about this class to use for seacrhing words - the array

class DictionarySearcher

  attr_accessor :words_found


  def search(method, user_input)
    case(method)
      when 1
        exact_match(user_input)
      when 2
        partial_match(user_input)
      when 3
        begins_with_match(user_input)
      when 4
        ends_with_match(user_input)
    end
  end

  def exact_match(user_input)
    count = 0
    @file.each do |word| 
      count+=1 if word == user_input.capitalize 
      @words_found << word
    end
    count
  end

  def partial_match(user_input)
    count = 0
    regex = /#{Regexp.quote(user_input)}/  
    result = @file.join(" ").scan(regex)
    @words_found << word
    
    count
  end

  def begins_with_match(user_input)

    # Return MatchData object for last match
    # "string".match(/USER_INPUT.* /)
    # /.*/ =~ "string"
  end

  def ends_with_match(user_input)

  end

end
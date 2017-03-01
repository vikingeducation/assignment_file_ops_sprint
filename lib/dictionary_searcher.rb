# DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.


require_relative 'dictionary'

class DictionarySearcher

  attr_accessor :words_found, :word_count, :word_arr

  def search(method, user_input, word_arr)
    @word_arr  = word_arr
    @word_count = 0
    @words_found = []

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

  def output_matches
    puts "Found #{@word_count} word(s)" 
    if(@word_count != 0) 
      @words_found.each do |word|
        puts "#{word}"
      end
    end
    puts "***"
  end

  def exact_match(user_input)
    @word_arr.each do |word| 
      if word.upcase == user_input.upcase 
        @word_count += 1 
        @words_found << word
      end
    end
  end

  def partial_match(user_input)
    regex = /#{user_input.upcase}/
    regex_searches(regex)
  end
    

  def begins_with_match(user_input)
    regex = /\A#{user_input.upcase}/
    regex_searches(regex)
  end

  def ends_with_match(user_input)
    regex = /\z#{user_input.upcase}/
    regex_searches(regex)
  end

  private

  def regex_searches(regex)
    @word_arr.each do |word| 
      if word.upcase.match(regex) 
        @word_count += 1 
        @words_found << word
      end
    end
  end

end
# DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.

class DictionarySearcher

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def exact_match(word)
    puts "EXACT!"
  end

  def partial_match(word)
    puts "PARTIAL!"
  end

  def begins_with(word)
    puts "BEGINS_WITH!"
  end

  def ends_with(word)
    puts "ENDS_WITH!"
  end
end
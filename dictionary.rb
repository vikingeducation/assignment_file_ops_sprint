require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'

class Dictionary
  attr_reader :dictionary
  
  def initialize
    @dictionary_loader = DictionaryLoader.new
    
  end

  def run
    @dictionary = @dictionary_loader.load
    puts "Dictionary succesfully loaded"
    puts "Your dictionary containts #{@dictionary.size} words"
    puts "Word frequency by starting letter:"
    display_word_count

    search_type = DictionaryUI.new.get_search_type
    assign_search_type(search_type)
  end

  def display_word_count
    ("a".."z").each do |letter|
      puts "#{letter}: #{@dictionary.count{|word| word[0].downcase == letter}}"
    end
  end

  def assign_search_type(type)
    d = DictionarySearcher.new
    case type[0]
      when 1
        d.exact_matches(type[1])
      when 2
        d.partial_matches(type[1])
      when 3 
        d.begins_with_matches(type[1])

      end
  end

end
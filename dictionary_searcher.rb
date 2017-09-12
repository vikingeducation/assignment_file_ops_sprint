require 'pry'

# perform any analysis on the dictionary you provide it
module SearcherFactory
  SEARCH_OPTIONS = {'1'=>'Exact', '2'=>'Partial', '3'=>'Begins with','4'=>'Ends with'}

  def self.create(search_type, word, dictionary)
    # DictionarySearcher.new(word, dictionary)
    case search_type
    when '3'
      BeginsWith.new(word, dictionary)
    when '4'
      EndsWith.new(word, dictionary)
    end
  end

end

class DictionarySearcher

  attr_accessor :matches

  def initialize(word, dictionary)
    @word = word
    @dictionary = dictionary
    @regex = nil
    @matches = []
  end

  def find_matches
    @dictionary.entries.each do |entry|
     @matches << entry if entry.match(@regex)
    end
    display_matches
    display_match_count
  end

  def display_matches
    puts @matches
  end

  def display_match_count
    puts '-----------------------'
    puts "Total Matches: #{@matches.length}"
  end

end

class BeginsWith < DictionarySearcher
  def initialize(word, dictionary)
    super(word, dictionary)
    @regex = /(^#{word}\w+)/i
  end
end

class EndsWith < DictionarySearcher
  def initialize(word, dictionary)
    super(word, dictionary)
    @regex = /(#{word}$)/
  end
end
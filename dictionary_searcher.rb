# perform any analysis on the dictionary you provide it
module SearcherFactory
  SEARCH_OPTIONS = {'1'=>'Exact', '2'=>'Partial', '3'=>'Begins with','4'=>'Ends with', '5'=> 'Has 3 chars that repeat'}

  def self.create(search_type)
    case search_type
    when '1'
      Exact.new
    when '2'
      Partial.new
    when '3'
      BeginsWith.new
    when '4'
      EndsWith.new
    when '5'
      RepeatThree.new
    end
  end
end

class DictionarySearcher

  def initialize
    @matches = []
  end

  def find_matches(word, dictionary)
    dictionary.entries.each do |entry|
     @matches << entry if entry.match(regex(word))
    end
    @matches
  end

  def regex(word)
    raise NotImplemented
  end

  private
  attr_accessor :matches
end

class Exact < DictionarySearcher
  def regex(word)
    /^\A#{word}\z/i
  end
end

class Partial < DictionarySearcher
  def regex(word)
    /#{word}/i
  end
end

class BeginsWith < DictionarySearcher
  def regex(word)
    /(^#{word}\w+)/i
  end
end

class EndsWith < DictionarySearcher
  def regex(word)
    /(#{word}$)/
  end
end

class RepeatThree < DictionarySearcher
  def regex(word)
    /(.{3}).*\1$/
  end
end
# DictionarySearcher is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.

class DictionarySearcher

  attr_accessor :matches

  def initialize(dictionary)
    @dictionary = dictionary
    @matches = []
  end

  # I'm thinking these methods should be primarily used to build arrays of matches.
  # There should be another method which takes that array and does the figure on it etc.

  def exact_match(search_word)
    @matches = []
    @dictionary.array.each do |word|
      @matches << word if ( word =~ /^#{search_word}$/ )
    end
    display_results(@matches)
  end

  def partial_match(search_word)
    @matches = []
    @dictionary.array.each do |word|
      @matches << word if ( word =~ /#{search_word}/ )
    end
    display_results(@matches)
  end

  def begins_with(search_word)
    @matches = []
    @dictionary.array.each do |word|
      @matches << word if ( word =~ /^#{search_word}/ )
    end
    display_results(@matches)
  end

  def ends_with(search_word)
    @matches = []
    @dictionary.array.each do |word|
      @matches << word if ( word =~ /#{search_word}$/ )
    end
    display_results(@matches)
  end

  private

  def display_results(matches)
    puts "Found #{matches.count} matches: "
    matches.each do |word|
      puts word
    end
  end
end
require 'pry'

class DictionaryAnalyzer
  # takes a dictionary and contains methods that provide simple statistics for how many words occur starting with each letter of the alphabet. Display these to the user when the dictionary is successfully read in.

  def initialize(dictionary)
    @dictionary = dictionary
    show_statistics
  end

  def run_search(selection)
    case selection
    when 1
      exact_match_search
    when 2
      partial_match_search
    when 3
      begins_with_search
    when 4
      ends_with_search
    end
  end

  private

  def show_statistics
    total_words
    words_by_letter
  end

  def total_words
    puts "Total word count is #{@dictionary.size}."
  end

  def words_by_letter
    letters = ('a'..'z').to_a
    results = []

    letters.each do |letter|
      word_count = @dictionary.count{ |word| word.downcase[0] == letter }
      results << "#{letter}: #{word_count}"
    end

    puts "Word counts by starting letter:"
    puts results.join(', ')
  end

  def exact_match_search
  end

  def partial_match_search
  end

  def begins_with_search
  end

  def ends_with_search
  end

end
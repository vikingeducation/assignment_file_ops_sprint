# analysis class - performs any analysis on the dictionary provided
require_relative 'dictionary'

class DictionarySearcher

  attr_accessor :results_array

  def initialize(search_term, dictionary)
    @search_term = search_term
    @search_dictionary = dictionary
    @results_array = []
  end


  def exact_matches
    @results_array << find_match(/\b#{@search_term}\b/)
    prints_results(@results_array)
  end

  def partial_matches
    @results_array << find_match(/#{@search_term}/)
    prints_results(@results_array)
  end

  def begins_with
    @results_array << find_match(/^#{@search_term}.+/)
    prints_results(@results_array)
  end

  def ends_with
    @results_array << find_match(/.+#{@search_term}$/)
    prints_results(@results_array)
  end

  private

  def prints_results(array)
    puts "Found #{@results_array.flatten!.length} match(es):"
    array.each do |word|
      puts word
    end
  end


  def find_match(regex)
    @search_dictionary.select{ |word| word.match(regex)}
  end

end

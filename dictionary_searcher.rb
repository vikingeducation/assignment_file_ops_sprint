# analysis class - performs any analysis on the dictionary provided
require_relative 'dictionary'

class DictionarySearcher

  attr_accessor :results_array, :exact, :partial, :begins_with, :ends_with

  def initialize(search_term, dictionary)
    @search_term = search_term
    @search_dictionary = dictionary
    @results_array = []
    @exact = /\b#{@search_term}\b/
    @partial = /#{@search_term}/
    @begins_with = /^#{@search_term}.*/
    @ends_with = /.*#{@search_term}$/
  end


  def search_for_matches(type)
    @results_array << find_match(type)
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

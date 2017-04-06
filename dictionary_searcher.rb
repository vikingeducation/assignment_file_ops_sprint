# analysis class - performs any analysis on the dictionary provided
require_relative 'dictionary'

class DictionarySearcher

  def initialize(search_term, dictionary)
    @search_term = search_term
    @search_dictionary = dictionary
  end

  def exact_matches
    exact_results = []
    exact_results << find_match(/\b#{@search_term}\b/)
    puts "found #{exact_results.flatten!.length} exact match(es):"
    prints_results(exact_results)
  end

  def partial_matches
    partial_results = []
    partial_results << find_match(/#{@search_term}/)
    puts "found #{partial_results.flatten!.length} partial match(es):"
    prints_results(partial_results)
  end

  def begins_with
    begins_with_results = []
    begins_with_results << find_match(/^#{@search_term}.+/)
    puts "found #{begins_with_results.flatten!.length} words that begin with #{@search_term}:"
    prints_results(begins_with_results)
  end

  def ends_with
    ends_with_results = []
    ends_with_results << find_match(/.+#{@search_term}$/)
    puts "Found #{ends_with_results.flatten!.length} words that end with #{@search_term}:"
    prints_results(ends_with_results)
  end

  private

  def prints_results(array)
    array.each do |word|
      puts word
    end
  end

  def find_match(regex)
    @search_dictionary.select{ |word| word.match(regex)}
  end

end

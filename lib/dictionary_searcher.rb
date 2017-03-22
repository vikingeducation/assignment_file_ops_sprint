class DictionarySearcher
  attr_reader :dictionary

  def initialize(dictionary = nil)
    @dictionary = dictionary
  end

  def exact_matches(search_term)
    results = []
    results << search_term if dictionary.words.include?(search_term)

    results
  end

  def partial_matches(search_term)
    results = []
    dictionary.words.each { |word| results << word if word.match(/#{search_term}/) }

    results
  end

  def begins_with_matches(search_term)
    results = []
    dictionary.words.each { |word| results << word if word.match(/^#{search_term}/) }

    results
  end

  def ends_with_matches(search_term)
    results = []
    dictionary.words.each { |word| results << word if word.match(/.*#{search_term}$/) }

    results
  end

  def display_results(results)
    puts "Found #{results.length} matches: "

    results.each { |result| puts result }
  end
end
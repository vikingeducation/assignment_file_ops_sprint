#DictionaryUI
require 'dictionary'
require 'dictionary_loader'
require 'dictionary_searcher'
require 'results_saver'

class DictionaryUI

  attr_reader :results

  def run
    puts "Where is your dictionary?"
    file_path = gets.chomp
    @dict_loader = DictionaryLoader.new
    @dictionary = @dict_loader.load(file_path)
    @stats = @dictionary.stats
    @dictionary_searcher = DictionarySearcher.new(@dictionary)
    print_stats
    search_prompt
    @results_saver=ResultsSaver.new
    save_results
  end

  def save_results
    puts "Do you want to save results? y/n"
    answer = gets.chomp
    overwrite = nil
    if answer == 'y'
      puts "What filepath should we write results to?"
      filepath = gets.chomp
      if File.exist?(filepath)
        puts "That file exists. Overwrite? y/n"
        answer = gets.chomp
        answer == 'y' ? overwrite = true : overwrite = false
      end
      @results_saver.handle_saving(filepath, @results) unless overwrite == false
    end
  end


  def print_stats
    puts "Dictionary succesfully loaded"
    puts "Your dictionary contains #{@stats[:word_count]} words"
    puts "Word frequency by starting letter:"
    @stats[:words_by_starting_letter].each do |k,v|
      puts "#{k}: #{v}"
    end
  end

  def search_prompt
    puts "What kind of search?"
    puts '1: Exact'
    puts '2: Partial'
    puts '3: Begins with'
    puts '4: Ends with'
    type = gets.chomp.to_i
    puts "What is your search term?"
    search_term = gets.chomp
    dispatch_search_prompt(type, search_term)
    puts '***'
  end

  def dispatch_search_prompt(type, search)
    case type
    when 1
      results = exact_search(search)
    when 2
      results = partial_match(search)
    when 3
      results = begins_with_matches(search)
    when 4
      results = ends_with_matches(search)
    end
    @results=results
    provide_formatted_results(results)
  end

  def provide_formatted_results(results)
    amount = results.length
    puts "Found #{amount} results:"
    results.each { |result| puts result }
  end

  def exact_search(search)
    @dictionary_searcher.exact_matches(search)
  end

  def partial_match(search)
    @dictionary_searcher.partial_matches(search)
  end

  def begins_with_matches(search)
    @dictionary_searcher.begins_with_matches(search)
  end

  def ends_with_matches(search)
    @dictionary_searcher.ends_with_matches(search)
  end

end

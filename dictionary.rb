require './dictionaryloader.rb'
require './dictionaryanalyzer.rb'

class Dictionary
  
  def initialize
    @wants_to_continue = true
  end
  
  def use
    prompt_for_dict_file
    @dictionary_analyzer.word_count
    @dictionary_analyzer.alphabet_word_count
    until !@wants_to_continue
      search_options
      perform_search(@option)
    end
  end
  
  def save_results(matches)
    puts ''
    puts "Would you like to save your results to a new file? (y/n)"
    
    response = gets.chomp.strip.downcase
    if response == "y"
      print "Enter the filename to store the results in: "
      results_file = gets.chomp.strip
      File.open(results_file, 'w') do |file|
        matches.each do |match|
          file.write match
          file.write "\n"
        end
      end
    end
  end
  
  def perform_search(option)
    matches = []
    if option == 'exact'
      puts''
      puts "What exact word would you like to search for?"
      print '> '
      @search_term = gets.chomp.strip
      matches = @dictionary_analyzer.exact_search(@search_term)
      save_results(matches)
    elsif option == 'partial'
      puts''
      puts "What partial term would you like to search for?"
      print '> '
      @search_term = gets.chomp.strip
      matches = @dictionary_analyzer.partial_search(@search_term)
      save_results(matches)
    elsif option == 'beginswith'
      puts''
      puts "What beginning term would you like to search for?"
      print '> '
      @search_term = gets.chomp.strip
      matches = @dictionary_analyzer.begins_with_search(@search_term)
      save_results(matches)
    elsif option == 'endswith'
      puts''
      puts "What exact word would you like to search for?"
      print '> '
      @search_term = gets.chomp.strip
      matches = @dictionary_analyzer.ends_with_search(@search_term)
      save_results(matches)
    elsif option == 'q'
      @wants_to_continue = false
    else
      puts ''
      puts 'Invalid option! Try again.'
      exit
    end
  end
  
  def search_options
    puts ''
    puts "Enter a search option, or 'q' to quit:"
    puts "'exact' for exact matching,"
    puts "'partial' for partial matching,"
    puts "'begins with' to search words beginning with something,"
    puts "'ends with' to search words ending in something."
    puts ''
    print '> '
    @option = gets.chomp.strip.downcase.split(" ").join
  end
  
  def prompt_for_dict_file
    puts ''
    print "Please enter the name of the dictionary file you'd like to use: "
    
    dict_file = gets.chomp.strip
    
    @dictionary_loader = DictionaryLoader.new(dict_file)
    @dictionary_analyzer = DictionaryAnalyzer.new(@dictionary_loader)
  end
  
end

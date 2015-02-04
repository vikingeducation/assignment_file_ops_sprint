require_relative 'dictionary_loader'
require_relative 'dictionary_analyzer'

class Dictionary
  attr_reader :dictionary, :analyzer, :search_results
  def initialize
    print "What is the name of the dictionary you want to load?\n > "
    dictionary_name = gets.chomp
    check_for_quit dictionary_name
    @dictionary = DictionaryLoader.new(dictionary_name).words
    @analyzer = DictionaryAnalyzer.new(dictionary)
    @search_results = search
    do_something_with_results
  end

  private

  def search
    print "\nHow would you like to search?\n1 for an exact match\n2 for partial matches\n3 to match beginning of word\n4 to match end of word\n > "
    search_style = gets.chomp.to_i
    check_for_quit search_style.to_s
    print "\nEnter your search string\n > "
    search_string = gets.chomp
    analyzer.search(search_style,search_string)
  end

  def valid? input
    ["P","S"].include? input
  end

  def check_for_quit(input)
    if input.upcase == "Q"
      puts "Goodbye!"
      exit
    end
  end

  def save_file(filename)
    File.open(filename, "w") do |file|
      @search_results.each do |result|
        file.write result
        file.write "\n"
      end
    end
  end

  def do_something_with_results
    puts "\nI found #{search_results.length} results."
    results_handling = choose_results_handling
    if results_handling == "P"
      puts search_results
    else
      save_results
    end
  end

  def choose_results_handling
    results_handling = nil
    until valid? results_handling
      print "Do you want to (P)rint to screen or (S)ave to file?\n > "
      results_handling = gets.chomp.upcase
      check_for_quit results_handling
    end
    return results_handling
  end

  def save_results
    print "Please name the output file\n > "
    filename = "output/#{gets.chomp}.txt"
    save_file_with_overwrite_guard filename
    confirm_file_saved filename
  end

  def save_file_with_overwrite_guard(filename)
    if File.exist? filename
      save_after_overwrite_confirmed filename
    else
      save_file filename
    end
  end

  def save_after_overwrite_confirmed(filename)
    puts "Do you want to overwrite the existing file?\n Y/N > "
    overwrite = gets.chomp
    check_for_quit overwrite
    if overwrite.upcase == "Y"
      save_file(filename)
    end
  end

  def confirm_file_saved(filename)
    if File.exist? filename
      puts "Your results were saved."
    else
      puts "Sorry, your results were not saved."
    end
  end
end

# Create a class (e.g. Dictionary) to handle the user interaction loop. The first prompt is to read in a dictionary file.
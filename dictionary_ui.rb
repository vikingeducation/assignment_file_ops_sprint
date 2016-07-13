require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'dictionary'
require_relative 'results_saver'

class DictionaryUI
  attr_reader :dictionary
  
  

  def run
    @dictionary = Dictionary.new(get_file_path).load
    print_intro
    loop do 
      search_type = get_search_type
      @matches = assign_search_type(search_type)
      display_matches(@matches)
      save_results?
      break unless search_again?
    end
  end

  def get_file_path
    begin
      puts "Where is your dictionary? ('q' to quit)"
      @location = gets.chomp
      exit if @location == "q"
    end until File.file?(@location)
    @location
  end

  def print_intro
    puts "Dictionary succesfully loaded"
    puts "Your dictionary containts #{@dictionary.size} words"
    puts "Word frequency by starting letter:"
    display_word_count
    puts
  end

  def get_search_type
    begin
      puts "What kind of search? Enter 1 - 4"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Starts with"
      puts "4: Ends with"
      type = gets.chomp.to_i
    end until (1..4).to_a.include?(type)
    puts
    puts "Enter the search term"
    search_term = gets.chomp
    [type, search_term]

  end

  def display_word_count
    ("a".."z").each do |letter|
      puts "#{letter}: #{@dictionary.count{|word| word[0].downcase == letter}}"
    end
  end

  def assign_search_type(type)
    d = DictionarySearcher.new(@dictionary)
    case type[0]
      when 1
        d.exact_matches(type[1])
      when 2
        d.partial_matches(type[1])
      when 3 
        d.begins_with_matches(type[1])
      when 4
        d.ends_with_matches(type[1])
      end
  end

   def display_matches(array)
    puts
    puts "Searching..."
    puts "Found #{array.length} matches:"
    puts array
  end

  def save_results?
    begin 
      puts
      puts "Do you want to save the results to a file? y/n?"
      save_file = gets.chomp
    end until save_file == "y" || save_file == "n"
    if save_file == "y"
      ask_for_file_name
    end
  end

  def ask_for_file_name
    puts
    puts "What file should we write the results to?"
    file_path = File.join("results_folder", gets.chomp)
    if File.file?(file_path)
      ask_to_overwrite(file_path)
    else
      ResultsSaver.new.save_results(@matches, file_path)
      puts "Results saved successfully to #{file_path}"
    end
  end

  def ask_to_overwrite(file_path)
    begin
      puts
      puts "That file already exists. Should we overwrite? y/n?"
      overwrite_file = gets.chomp
    end until overwrite_file == "y" || overwrite_file == "n"
    if overwrite_file == "y"
      ResultsSaver.new.save_results(@matches, file_path)
      puts "Results saved successfully to #{file_path}"
    else
      exit
    end
  end

  def search_again?
    begin
      puts
      puts "Do you want to search again? y/n?"
      search_again = gets.chomp
    end until search_again == "y" || search_again == "n"
    if search_again == "y"
      true
    else
      false
    end

  end













end
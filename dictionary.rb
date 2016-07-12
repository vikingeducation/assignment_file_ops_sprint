require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'

class Dictionary
  attr_reader :dictionary
  
  def initialize
    @dictionary_loader = DictionaryLoader.new
    
  end

  def run
    @dictionary = @dictionary_loader.load
    puts "Dictionary succesfully loaded"
    puts "Your dictionary containts #{@dictionary.size} words"
    puts "Word frequency by starting letter:"
    display_word_count
    search_type = DictionaryUI.new.get_search_type
    @matches = assign_search_type(search_type)
    display_matches(@matches)
    save_results?
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
    puts "Searching..."
    puts "Found #{array.length} matches:"
    puts array
  end

  def save_results?
    puts "Do you want to save the results to a file? y/n?"
    save_file = gets.chomp
    if save_file == "y"
      ask_for_file_name
    else
      exit
    end
  end

  def ask_for_file_name
    puts "What filepath should we write the results to?"
    file_path = gets.chomp
    if File.file?(file_path)
      ask_to_overwrite(file_path)
    else
      File.open(file_path, "w+") do |file|
        file.write @matches
      end
    end
  end

  def ask_to_overwrite(file_path)
    puts "That file already exists. Should we overwrite? y/n?"
    overwrite_file = gets.chomp
    if overwrite_file == "y"
      File.open(file_path, "w+") do |file|
        file.write @matches
      end
    else
      exit
    end
  end













end
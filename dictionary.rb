class DictionaryUI

  attr_reader :loaded_dictionary, :search

  def initialize(loaded_dictionary=nil)
    @loaded_dictionary = loaded_dictionary
    @search = DictionarySearcher.new
  end

  def run
    puts "Where is your dictionary? ('q' to quit)"
    file_path = gets.chomp
    return if file_path == "q"
    @loaded_dictionary = DictionaryLoader.new(file_path)
    puts
  end

  def search
    raise "No dictionary loaded. Use #run method" if @loaded_dictionary == nil
    @search.search(@loaded_dictionary.words)
  end

end

class DictionaryLoader

  attr_reader :words

  def initialize(file_path)
    @words = []
    File.readlines(file_path).each { |word| @words << word.strip }
    @dictionary = Dictionary.new(@words)
    dictionary_stats
  end

  def dictionary_stats
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{words.length} words"
    word_frequency
  end

  def word_frequency
    puts "Word frequency by starting letter:"
    letters = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    letters.each do |letter|
      counter = @words.select { |word| word[0].upcase == letter }.length
      puts "#{letter}: #{counter}"
    end
  end

end

class Dictionary

  attr_reader :words

  def initialize(words)
    @words = words
  end

end

class DictionarySearcher

  attr_accessor :save, :results

  def initialize
    @save = ResultsSaver.new
    @results = []
  end

  def search(words)
    puts "What kind of search?\n1: Exact\n2: Partial\n3: Begins With\n4: Ends With"
    option = gets.chomp
    puts "Enter the search term"
    search = gets.chomp
    case option
    when "1"
      exact_search(search, words)
    when "2"
      partial_search(search, words)
    when "3"
      begins_search(search, words)
    when "4"
      ends_search(search, words)
    end
  end

  def exact_search(search, words)
    @results = words.select { |word| word.match(/^#{search}$/i) }
    display_results
  end

  def partial_search(search, words)
    @results = words.select { |word| word.match(/#{search}/i) }
    display_results
  end

  def begins_search(search, words)
    @results = words.select { |word| word.match(/^#{search}/i) }
    display_results
  end

  def ends_search(search, words)
    @results = words.select { |word| word.match(/#{search}?/i) }
    display_results
  end

  def display_results
    puts "Found #{@results.length} match(es):"
    puts @results
    @save.prompt(@results)
  end

end

class ResultsSaver

  attr_accessor :ready_to_save

  def initialize
    @ready_to_save = ""
  end

  def prompt(results)
    puts "Do you want to save results? y/n? 'q' quits."
    choice = gets.chomp
    return if choice == "q"
    process_results(results) if choice == "y"
  end

  def process_results(results)
    @ready_to_save = results.join("\n")
    where_to_save
  end

  def where_to_save
    puts "What filepath should we write results to?"
    save_path = gets.chomp
    check_to_overwrite(save_path)
  end

  def check_to_overwrite(save_path)
    if File.exist?(save_path)
      puts "File exists. Overwrite? y/n?"
      choice = gets.chomp
      if choice == "y"
        puts "Overwriting File"
        File.open(save_path, "w+") do |file|
          file.write @ready_to_save
        end
      else
        puts "Saving to end of file."
        File.open(save_path, "a+") do |file|
          file.write @ready_to_save
        end
      end
    else
      puts "Creating new file"
      File.open(save_path, "w+") do |file|
        file.write @ready_to_save
      end
    end
  end

end

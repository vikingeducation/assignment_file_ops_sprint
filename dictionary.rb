require 'yaml'

class Dictionary

  def initialize
    @dict = []
  end

  def get_dictionary(filename)
    @dict = DictionaryLoader.new(filename).dict
    @dict = DictionaryAnalyzer.new(@dict)
  end

  def print_stats
    puts @dict.word_count
    puts @dict.words_starting_with("a")
    #puts @dict.partial_match("ab")
    #puts @dict.begins_with("ab")
    puts @dict.ends_with("re")

  end

  def load_file
    puts "Enter the file name"
    filename = gets.chomp
    get_dictionary(filename) if File.exist? (filename)
  end

  def run
    load_file
    result = perform_search(search_type)
    display_matches(result)
    display_or_save(result)
  end

  def display_matches(result)
    puts "There were #{result.length} matches."
  end

  def display_or_save(result)
    puts "Do you want to (1) save the results or (2) display to screen?"
    input = gets.chomp
    case input
    when 1
      save_to_file(result)
    when 2
      p(result)
    end
  end

  def save_to_file(result)
    puts "Name your file:"
    file_name = gets.chomp
    if File.exist? file_name
    save(result)

  end

  def save(result)
    my_dump = YAML::dump(result)
    my_file
  end


  def perform_search(search_type)
    puts "What are we looking for?"
    input = gets.chomp
    case search_type
    when 1
      @dict.exact_match(input)
    when 2
      @dict.partial_match(input)
    when 3
      @dict.begins_with(input)
    when 4
      @dict.ends_with(input)
    end
  end

  def search_type
    puts "(1) exact match"
    puts "(2) partial match"
    puts "(3) begins with"
    puts "(4) ends with"
    input = 0
    loop do
      input = gets.chomp
      break if (1..4).include? input
      puts "Please enter option 1-4:"
    end
    input
  end
end


class DictionaryLoader

  attr_reader :dict

  def initialize(filename)
    @dict = read_from_file(filename)
  end

  def read_from_file(filename)
    File.readlines(filename) do |line|
      line.chomp
    end
  end

end

class DictionaryAnalyzer

  def initialize(dict)
    @dict = dict
  end

  def word_count
    @dict.length
  end

  def words_starting_with(letter)
    @dict.select{|word| word[0].downcase == letter.downcase}.length
  end

  def exact_match(word)
    (@dict.include?(word.downcase)||@dict.include?(word.capitalize)) ? word : false
  end

  def partial_match(input)
    input = input.downcase
    return @dict.reject{|word| (/#{input}/ =~ word.downcase).nil?}
  end

  def begins_with(input)
    input = input.downcase
    return @dict.reject{|word| (/^#{input}/ =~ word.downcase).nil?}
  end

  def ends_with(input)
    input = input.downcase
    return @dict.reject{|word| (/\w+#{input}\b/ =~ word.downcase).nil?}
  end



end

dict = Dictionary.new
dict.load_file
dict.print_stats
# TODOS
# Fix long references: @loader...
# Fix file check

class DictionaryUI

  def initialize 
    @loader = DictionaryLoader.new
  end

  def run
  	ask_source_filepath
    show_stats
    enter_search_term if search?
    @loader.dict.search_query.search(search_type, enter_search_term)
    save_results if save?
  end

  def ask_source_filepath
    puts "Where is your dictionary? ('q' to quit)"
    filepath = gets.chomp

    if filepath == "q"
    	exit
    else 
      @loader.load(filepath) if File.file?(filepath)
    end
    
  end

  def show_stats
    puts "Dictionary successfully loaded."
    puts "Your dictionary contains #{@loader.dict.dictionary.length} words."
    puts "Word frequency by starting letter:"
    @loader.dict.word_count.each do |letter, word_count|
      puts "#{letter}: #{word_count}"
    end
  end

  def search?
    loop do 
      puts "Do you want to search this dictionary? (y/n)"
      search_answer = gets.chomp
      if search_answer == "y"
        puts "What kind of search? (Enter number)"
        puts "1: Exact"
        puts "2: Partial"
        puts "3: Begins With:"
        puts "4: Ends With:"
        print "> "
        search_type = gets.chomp.to_i
      end 
      break if search_type.between?(1..4) || search_answer == "n"
    end
    search_answer == "y"
  end

  def enter_search_term
    loop do 
      print "Enter your search term: "
      search_term = gets.chomp 
      break if letter?(search_term)
    end

  end

  def letter?(search_term)
    search_term =~  /[[:alpha:]]/
  end
end

class DictionaryLoader
  
  attr_reader :dict

  def load(file)
  	@processed_dictionary = []
    File.readlines(file).each {|line| @processed_dictionary << line.upcase.strip}

    @dict = Dictionary.new(@processed_dictionary)
  end

end

class Dictionary

  attr_accessor :dictionary
  attr_reader :word_count, :search_query

  def initialize(processed_dictionary)
    @dictionary = processed_dictionary
    @word_count = {}
    words_per_letter
    @search_query = DictionarySearcher.new(@dictionary)
  end

  def words_per_letter 
    ("A".."Z").each do |letter|
      @word_count[letter] = 0

      @dictionary.each do |word|
        @word_count[letter] += 1 if word.start_with?(letter)
      end
    end

  end

end

class DictionarySearcher
  
  def initialize(dictionary)
    @dictionary = dictionary
    @results = []
  end

  def search(search_type, search_term)
    case search_type
    when 1
      exact(search_term)
    when 2
      partial(search_term)
    when 3
      begins_with(search_term)
    when 4
      ends_with(search_term)
    end
  end

  def exact(search_term)
    @results = @dictionary.select {|word| word == search_term}
  end

  def partial(search_term)
    @results = @dictionary.select {|word| word.include?(search_term)}
  end

  def begins_with(search_term)
    @results = @dictionary.select {|word| word.start_with?(search_term)}
  end

  def ends_with(search_term)
    @results = @dictionary.select {|word| word.end_with?(search_term)}
  end

  @results.each {|matched| puts matched}

end

class ResultsSaver

end

d = DictionaryUI.new
d.run
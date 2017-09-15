class Search
  def initialize(dictionary)
    @dictionary = dictionary
    @search_type = request_search_type
    @word = request_word

    @matches = set_matches
  end

  def to_s
    "------------------------------\n" \
    "The results for '#{word}' are:\n" \
    "#{render_matches}" \
    "-----------------------\n" \
    "Total Matches: #{matches.length}\n"
  end

  private

  attr_reader :word, :search_type, :dictionary, :matches

  def render_matches
    matches.each_with_object("") { |match, output| output << "#{match}\n" }
  end

  def set_matches
    searcher = SearcherFactory.create(search_type)
    searcher.find_matches(word, dictionary)
  end

  def request_word
    puts '','Enter your word to search:'
    response = gets.chomp.strip
    quit?(response)
    response
  end

  def request_search_type
    puts '','What kind of search would you like to perform?'
    options = SearcherFactory::SEARCH_OPTIONS
    display_search_type_options(options)
    response = gets.chomp
    quit?(response)
    until options.keys.include?(response.strip)
      puts "I'm sorry #{response} is not an option."
      display_search_type_options(options)
      response = gets.chomp
    end
    response
  end

  def display_search_type_options(options)
    puts 'Enter the number of one of these options:'
    options.each {|num, option| puts "#{num}: #{option}"}
  end

  def quit?(response)
    exit_program if response == 'q'
  end

end


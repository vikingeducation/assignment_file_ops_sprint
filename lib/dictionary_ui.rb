class DictionaryUI

  def run
    filepath = gets_dictionary_filepath
    dictionary = DictionaryLoader.load(filepath)
    dictionary_searcher = DictionarySearcher.new(dictionary)
    display_dictionary_stats(dictionary_searcher)
    choice = prompt_for_search_type
    term = prompt_for_search_term
    matches = dictionary_searcher.parse_input(choice.to_i, term)
    parse_output(matches)
    save_file if prompt_save_file?
  end

  def gets_dictionary_filepath
    puts "Enter dictionary filepath please"
    gets.chomp
  end

  def display_dictionary_stats(searcher)
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{searcher.word_count} words."
    puts "Word frequency by starting letter:"
    render_frequencies(searcher.word_frequency_by_letter)
  end

  def render_frequencies(frequencies)
    frequencies.each do |letter, count|
      puts "#{letter.upcase}: #{count}"
    end
  end

  def prompt_for_search_type
    puts "Whaddya wanna search for?"
    puts "Enter 1 for exact matches search"
    puts "Enter 2 for partial match search"
    puts "Enter 3 for begins with search"
    puts "Enter 4 for ends with search"
    search_choice = gets.chomp
  end

  def prompt_for_search_term
    puts "Enter that search criterion, yo"
    search_term = gets.chomp
  end

  def parse_output(matches)
    puts "Found #{matches.length} matches for your search"
    if matches.length > 0
      puts "Here they are:"
      puts matches
    end
  end

  def prompt_save_file?
    puts "Would you like to save the results to a file? y/n"
    if gets.chomp == "y"
      prompt_for_file_name
    else
      puts "Thanks for searching"
  end

  def prompt_for_file_name
    puts ""
    file_name = gets.chomp
  end

end

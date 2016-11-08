class DictionaryUI

  def run
    filepath = gets_dictionary_filepath
    dictionary = DictionaryLoader.load(filepath)
    dictionary_searcher = DictionarySearcher.new(dictionary)
    display_dictionary_stats(dictionary_searcher)
    choice = prompt_for_search_type
    term = prompt_for_search_term
    dictionary_searcher.parse_input(choice, term)
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

end

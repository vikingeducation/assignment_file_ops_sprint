class DictionaryUI

  def run
    filepath = gets_dictionary_filepath
    dictionary = DictionaryLoader.load(filepath)
    dictionary_searcher = DictionarySearcher.new(dictionary)
    display_dictionary_stats(dictionary_searcher)
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
end

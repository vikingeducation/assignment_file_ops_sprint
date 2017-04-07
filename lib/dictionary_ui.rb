class DictionaryUI

  def get_path
    puts "Where is your dictionary? ('q' to quit)"
    print "> "
    # current_path = gets.chomp
    current_path = "5desk.txt"
    close_dictionary?(current_path)
    return current_path
  end

  def search_action
    puts "Please enter the word to search"
    print "> "
    current_word = gets.chomp
    return current_word
  end

  def file_loaded
    puts
    puts "Dictionary successfully loaded"
  end

  def stat_count(num_of_words, words_with_letters)
    puts "Your dictionary contains #{num_of_words} words."
    puts "Word frequency by starting letter:"
    words_with_letters.each do |letter, count|
      puts "#{letter}: #{count}"
    end
  end

  def word_found(word_to_find, found_word = nil)
    if found_word
      puts "We found #{found_word} in the dictionary"
    else
      puts "We could not find #{word_to_find} in the dictionary"
    end
  end

  def dictionary_menu
    puts "What would you like to do?"
    puts "1. Search for words"
    puts "q. Quit the program"
    gets.chomp
  end

  def search_menu
    puts "What kind of search?"
    puts "1: Exact"
    puts "2. Partial"
    puts "3. Begins With"
    puts "4. Ends With"
    print "> "
    return gets.chomp
  end

  def close_dictionary?(choice)
    if choice == 'q' || choice == 'Q'
      puts "Thanks for using the dictionary"
      exit
    end
  end
end

class DictionaryUI
  def get_path
    puts "Where is your dictionary? ('q' to quit)"
    print '> '
    # current_path = gets.chomp
    current_path = '5desk.txt'
    close_dictionary?(current_path)
    current_path
  end

  def get_save_path
    puts "Where do you want to save this file?"
    print '> '
    current_path = gets.chomp
    close_dictionary?(current_path)
    current_path
  end

  def search_action
    puts 'Please enter the word to search'
    print '> '
    current_word = gets.chomp
    current_word
  end

  def file_loaded
    puts
    puts 'Dictionary successfully loaded'
  end

  def stat_count(num_of_words, words_with_letters)
    puts "Your dictionary contains #{num_of_words} words."
    puts 'Word frequency by starting letter:'
    words_with_letters.each do |letter, count|
      puts "#{letter}: #{count}"
    end
  end

  def word_found(found_word = nil, num_of_words = nil)
    num_of_words = found_word.length if found_word.is_a? Array
    if num_of_words
      puts "We found #{num_of_words} match(es)"
      found_word.each do |word|
        puts word.upcase.to_s
      end
    end
  end

  def dictionary_menu
    puts 'What would you like to do?'
    puts '1. Search for words'
    puts 'q. Quit the program'
    gets.chomp
  end

  def search_menu
    loop do
      puts 'What kind of search?'
      puts '1: Exact'
      puts '2. Partial'
      puts '3. Begins With'
      puts '4. Ends With'
      print '> '
      choice = gets.chomp
      close_dictionary?(choice)
      return choice if %w(1 2 3 4).include? choice
    end
  end

  def close_dictionary?(choice)
    if choice == 'q' || choice == 'Q'
      puts 'Thanks for using the dictionary'
      exit
    end
  end

  def save_results?
    loop do
      puts "Do you want to save these results?"
      puts '1. Yes'
      puts '2. No'
      choice = gets.chomp
      close_dictionary?(choice)
      if %w(1 2).include? choice
        return choice == "1" ? true : false
      end
    end
  end
end

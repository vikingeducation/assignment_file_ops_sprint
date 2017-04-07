class Dictionary
  attr_reader :ui, :dictionary_file

  def initialize
    @ui = DictionaryUI.new
    @dictionary_file = DictionaryLoader.load_file(ui.get_path)
    @searcher = DictionarySearcher.new
  end

  def init
    ui.file_loaded
    basic_stats
    run
  end

  def run
    loop do
      choice = ui.dictionary_menu
      determine_action(choice)
    end
  end



  def basic_stats
    num_of_words = dictionary_file.length
    words_with_letters = determine_words_with_letters(dictionary_file)
    ui.stat_count(num_of_words, words_with_letters)
  end

  def determine_words_with_letters(dictionary)
    word_check = {}
    dictionary.each do |word|
      unless word_check[word[0].upcase]
        word_check[word[0].upcase] = 1
      else
        word_check[word[0].upcase] += 1
      end
    end

    return word_check
  end

  def determine_action(choice)
    ui.close_dictionary?(choice)
    action = ui.search_menu
    word = ui.search_action
    if action == "1"
      found_word = @searcher.exact_match(word, dictionary_file)
    elsif action == "2"
      found_word = @searcher.partial_match(word, dictionary_file)
    elsif action == "3"
      found_word = @searcher.begins_with_match(word, dictionary_file)
    elsif action == "4"
      found_word = @searcher.ends_with_match(word, dictionary_file)
    end

    ui.word_found(word, found_word)
    return
  end
end

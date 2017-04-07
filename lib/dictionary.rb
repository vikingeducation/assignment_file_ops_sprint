class Dictionary
  attr_reader :ui, :dictionary_file, :searcher

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

  private

  def run
    loop do
      choice = ui.dictionary_menu
      found_words = determine_action(choice)
      ui.word_found(found_words)
      save_to_file?(found_words)
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
    case action
    when "1"
      found_word = searcher.exact_match(word, dictionary_file)
    when "2"
      found_word = searcher.partial_match(word, dictionary_file)
    when "3"
      found_word = searcher.begins_with_match(word, dictionary_file)
    when "4"
      found_word = searcher.ends_with_match(word, dictionary_file)
    else
      return
    end

    return found_word
  end

  def save_to_file?(found_words)
    return if ui.save_results? == false
    file_path = ui.get_save_path
    ResultsSaver.write_to_file(found_words, file_path)
    nil
  end
end

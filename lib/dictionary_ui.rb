require_relative "dictionary_loader"
require_relative "dictionary"
require_relative "dictionary_searcher"
require_relative "results_saver"

class DictionaryUI

  def initialize
    @place_to_save = ""
    @word_to_lookup = ""
    @user_choice = ""
    @dictionary_file = ""
  end

  def display
    get_user_input
    check_default
    search
    save
  end

  def create_dictionary
    Dictionary.new(@dictionary_file).words
  end

  def search
    DictionarySearcher.new.search(create_dictionary, @word_to_lookup, @choice)
  end

  def save
    ResultsSaver.new.save(@word_to_lookup, @user_choice, @place_to_save)
  end

  def check_default
    @dictionary_file = nil if dictionary_file == ""
    @place_to_save = nil if place_to_save == ""
  end

  def valid_word?(choice)
    choice[/\A[a-z]+\z/]
  end

  def valid_search_choice?(choice)
    ["exact", "partial", "ends", "begins"].include?(choice)
  end

  def valid_file?(choice)
    !!choice[/.txt$/]
  end

  def get_user_input
    puts "What is your dictionary file?"
    @dictionary_file = gets.chomp valid_file?(@dictionary_file)
    puts "What word to you want to lookup?"
    @word_to_lookup = gets.strip until valid_word?(@word_to_lookup)
    puts "Do you want to search for:"
    puts "1. Exactly the word(exact)"
    puts "2. Partial(partial)"
    puts "3. Beginning of a word(begins)"
    puts "4. End of a word(ends)"
    @user_choice = gets.chomp.downcase until valid_search_choice?(@user_choice)
    puts "Where do you want to save it?"
    @place_to_save = gets.chomp until valid_file?(@place_to_save)
  end

end

DictionaryUI.new.display

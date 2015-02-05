require 'pry'

class Dictionary # Handles user interaction loop
  attr_accessor :loader, :analyzer
  def initialize
    @loader = DictionaryLoader.new
    @analyzer = DictionaryAnalyzer.new(loader)
    @user_quits = false
    run_program
  end

  private

  def run_program
    display_start_message
    until @user_quits
      display_prompt
      user_choice = get_user_choice
      binding.pry
      if (user_choice.to_s.downcase == 'q')
        puts "You quit."
        @user_quits = true
        exit
      end
      choices(user_choice.to_i)
    end
  end

  def display_start_message
    @analyzer.starting_message
  end

  def display_prompt
    puts "Choose what you would like to do, q to quit: "
    puts "1: Exact search"
    puts "2: Partial search"
    puts "3: Begins with"
    puts "4: Ends with"
  end

  def choices user_choice
    search_word = get_user_word
    results = []
    case user_choice
      when 1
        results = @analyzer.exact_search search_word
      when 2
        results = @analyzer.partial_search search_word
      when 3
        results = @analyzer.begins_with_search search_word
      when 4
        results = @analyzer.begins_with_search search_word
      else
        puts "Invalid entry, please try again"
        return
    end
    save_or_quit(prommpt_save_or_print, results)
  end

  def get_user_choice
    puts "Enter your choice: "
    user_choice = gets.chomp
  end

  def get_user_word
    puts "Enter your word: "
    search_word = gets.chomp
  end

  def get_file_name
    puts "What would you like to name the file?"
    file_name.gets.chomp
  end

  def prommpt_save_or_print
    user_choice = ""
    until ["p", "s"].include?(user_choice)
      puts "Would you like to save (S) or print (P) the results?"
      user_choice = gets.chomp.downcase
    end
    user_choice
  end

  def save_or_quit (user_choice, results)
    case user_choice.downcase
    when 'p'
      @loader.print_results(results)
    when 's'
      @loader.save_results(results)
    end
  end


end

class DictionaryLoader # Reads and writes dictionary file
  attr_accessor :file
  def initialize
    @file = load_file
  end

  def load_file # Independent function for modularity
    File.open("5desk.txt", "r")
  end

  def print_results results
    results.each {|word| puts word}
  end

  def save_results results
    file_name = get_file_name
    File.open(file_name, "w") do |file|
      results.each do |result|
        file.write result
        file.write "\n"
      end
    end
  end

  def get_file_name
    puts "What do you want the file to be named?"
    file_name = gets.chomp
  end

end

class DictionaryAnalyzer # Provides simple statistics for various methods
  attr_accessor :array_of_words
  def initialize(loader)
    @loader = loader
    @array_of_words = @loader.file.readlines.each{|word| word.chomp!}
  end

  def starting_message
    number_of_words = word_count
    puts "Number of words in total: #{number_of_words}"
    words_starting_with_letter
  end

  def word_count
    @array_of_words.length
  end

  def words_starting_with_letter
    letter = 'a'
    number_dictionary_words = word_count
    words_list = []
    iteration = 0

    number_dictionary_words.times do
      if (@array_of_words[iteration][0].downcase == letter)
        words_list << array_of_words[iteration]
        iteration += 1
      else
        puts "# words starting with #{letter}: #{words_list.length - 1}"
        # Convert char to Fixnum, increase by 1, convert back to char
        letter = (letter.ord + 1).chr

        # Clear the array for the next letter
        words_list.clear
      end
    end
    # Print the statement for 'z'
    puts "# words starting with #{letter}: #{words_list.length - 1}"
  end

  def search
    @array_of_words.select {|word_in_array| word_in_array =~ yield}
  end

  def exact_search search_query
    search{/^#{search_query}$/}
  end

  def partial_search search_query
    search{/#{search_query}/}
  end

  def begins_with_search search_query
    search{/^#{search_query}/}
  end

  def ends_with_search search_query
    search{/#{search_query}$/}
  end
end

a = Dictionary.new
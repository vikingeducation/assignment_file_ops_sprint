class Dictionary # Handles user interaction loop
  attr_accessor :loader, :analyzer
  def initialize
    @loader = DictionaryLoader.new
    @analyzer = DictionaryAnalyzer.new(loader)
    @user_quits = false
  end

  def run_program
    until user_quits
      puts "Choose what you would like to do: "
      puts "1: Exact search"
      puts "2: Partial search"
      puts "3: Begins with"
      puts "4: Ends with"
      puts "Enter your choice: "
    end
  end

  def choices user_choice

  end

  def get_file_name
    puts "What would you like to name the file?"
    file_name.gets.chomp
  end
end

class DictionaryLoader # Reads dictionary file
  attr_accessor :file
  def initialize
    @file = load_file
  end

  def load_file # Independent function for modularity
    File.open("5desk.txt", "r")
  end

  def write_file
  end
end

class DictionaryAnalyzer # Provides simple statistics for various methods
  attr_accessor :array_of_words
  def initialize(loader)
    @loader = loader
    @array_of_words = @loader.file.readlines
    starting_message
  end

  def starting_message
    number_of_words = word_count
    puts "Number of words in total: #{number_of_words}"
    words_starting_with_letter
  end

  def word_count
    array_of_words.length
  end

  def words_starting_with_letter
    letter = 'a'
    number_dictionary_words = word_count
    words_list = []
    iteration = 0

    number_dictionary_words.times do
      if (array_of_words[iteration][0].downcase == letter)
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

  def exact_search search_query
  end

  def partial_search search_query
  end

  def begins_with_search search_query
  end

  def ends_with_search search_query
  end

end

a = Dictionary.new
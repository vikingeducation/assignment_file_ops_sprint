require_relative 'dictionary'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI
  def run
    loop do
      open_prompt
      load_dictionary
      @new_dict.show_stats
      searcher = DictionarySearcher.new(@new_dict.entries)

      # Get search criteria from user
      search_type_prompt
      search_term_prompt

      # Execute search, then display hits for specified criteria
      searcher.search(@type, @term)
      hits = searcher.show_results

      # Prompt user to save results; if not, jump to next loop iteration
      save_prompt(hits)
    end
  end

  def open_prompt
    puts "Welcome to the spectacular command line semi-dictionary!"
    puts "(Enter 'q' at any prompt to quit)\n"
    puts "Where is your dictionary?"

    @open_path = gets.chomp
    quit if @open_path == 'q'

    # Some rudimentary error handling: http://stackoverflow.com/questions/8590098/how-to-check-for-file-existence
    raise "File not found" unless File.file?(@open_path)
  end

  def load_dictionary
    @new_dict = DictionaryLoader.new.load(@open_path)
    raise "Failed to load dictionary" unless @new_dict
  end

  def save_prompt(results)
    puts "Would you like to save? (y/n)"

    response = gets.chomp.downcase
    quit if response == 'q'

    if response == 'y'
      puts "Enter the path where you would like to save your results:"

      save_path = gets.chomp
      quit if save_path == 'q'

      ResultsSaver.new.save(save_path, results)
    end
  end

  def search_type_prompt
    loop do
      puts "What kind of search?"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With"
      puts "4: Ends With"

      @type = gets.chomp.to_i
      quit if @type == 'q'

      (1..4).include?(@type) ? break : "Error! Invalid input."
    end
  end

  def search_term_prompt
    puts "Enter the search term"

    @term = gets.chomp
    quit if @term == 'q'
  end

  def quit
    puts 'Goodbye!'
    exit
  end
end

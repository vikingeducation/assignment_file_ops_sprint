require_relative 'dictionary.rb'
require_relative 'dictionary_loader.rb'
require_relative 'dictionary_searcher.rb'
require_relative 'results_saver.rb'

class DictionaryUI
  def run
    loop do
      # TODO: add UI loop
    end
  end

  def open_prompt
    puts "Welcome to the spectacular command line semi-dictionary!"
    puts "(Enter 'q' at any prompt to quit)\n"
    puts "Where is your dictionary?"
    fpath = gets.chomp
    quit if path == 'q'

    # Some rudimentary error handling: http://stackoverflow.com/questions/8590098/how-to-check-for-file-existence
    raise "Error: file not found" unless File.file?(fpath)
  end

  def load_dictionary
    @dict = DictionaryLoader.new.load(fpath)
    puts "Dictionary successfully loaded."
  end

  def save_prompt(results)
    puts "Enter the path where you would like to save your results:"
    fpath = gets.chomp
    quit if path == 'q'
    ResultsSaver.new.save(fpath, results)
  end

  def show_stats
    puts "Your dictionary contains #{@dict.word_count} words."
    puts "Word frequency by starting letter:"
    @dict.keys.sort { |key, val| puts "#{key}: #{val}" }
  end

  def quit
    puts 'Goodbye!'
    exit
  end
end

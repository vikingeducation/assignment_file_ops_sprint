require_relative "dictionary_loader.rb"
require_relative "dictionary_searcher.rb"
require_relative "results_saver.rb"
require_relative "dictionary.rb"

class DictionaryUI
  def run
    path = dictionary_path
    dict = Dictionary.new(load_dictionary(path))
    type = search_type
    term = search_term
    search_results = search_dictionary(dict, type, term)
    save_results(search_results)
  end

  def dictionary_path
    puts "Enter the dictionary path, ('q' to quit)"
    ip = gets.chomp
    exit if ip == 'q'
    ip
  end

  def search_term
    puts "Enter the search term>"
    gets.chomp.upcase
  end

  def save_results(search_results)
    puts "Do you want to save the results? y/n? 'q' quits."
    ip = nil
    loop do
      ip = gets.chomp
      exit if ip == 'q'
      break if ['y', 'n'].include?(ip)
      puts "Please enter a valid input. y/n? 'q' quits."
    end
    if ip == 'y'
      ResultsSaver.save(search_results)
    else
      puts "Results not saved! Exiting.."
    end
  end

  def search_type
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
    ip = nil
    loop do
      ip = gets.chomp.to_i
      break if [1, 2, 3, 4].include?(ip)
      puts "Please enter a valid input [1, 2, 3 or 4] >"
    end
    ip
  end

  def load_dictionary(path)
    DictionaryLoader.new.load(path)
  end

  def search_dictionary(dict, type, term)
    p DictionarySearcher.search(dict, type, term)
  end
end

d = DictionaryUI.new
d.run

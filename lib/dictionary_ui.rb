require_relative "./dictionary_searcher"
require_relative "./dictionary"
require_relative "./dictionary_loader"
require_relative "./results_saver"

# controls functions based on input
class DictionaryUI

  def initialize
  end

  def run
    begin
      filename = prompt_filename
      abort if quit?(filename) 
      dict = DictionaryLoader.load(filename)
    rescue Errno::ENOENT => e
      puts e
      retry
    end
    display_stats(dict)
    loop do
      option_choice = display_options
      abort if quit?(option_choice)

      puts "What would you like to search for?"
      search_expression = gets.chomp

      results = nil
      case option_choice.to_i
      when 1
        #Exact matches
        results = DictionarySearcher.exact_match(dict, search_expression)
      when 2
        #Partial matches
        results = DictionarySearcher.partial_match(dict, search_expression)
      when 3
        #Begins_with
        results = DictionarySearcher.begins_with(dict, search_expression)
      when 4
        #Ends_with
        results = DictionarySearcher.ends_with(dict, search_expression)
      end
      
      display_results(results)
      option_choice = ask_about_saving
      
      if option_choice
        puts "Save successful!" if save(results)
      end
    end
  end

  def prompt_filename
    puts "Where's your dictionary?"
    gets.chomp
  end

  private 

    def save(results)
      puts "Type in the filename for your results."
      filename = gets.chomp + ".txt"
      ResultsSaver.save(results, filename)
    end

    def display_results(results)
      puts
      puts "Found #{results.length} matches:"
      results.each do |word|
        puts word
      end
    end

    def ask_about_saving
      begin
        puts "Would you like to save these results? (Y or N)"
        input = gets.chomp.upcase
      end until ["Y", "N"].include?(input)
      input == "Y"
    end

    def quit?(user_input)
      inp = user_input.downcase
      inp == 'quit' || inp == 'q'
    end

    def display_stats(dictionary)
      puts "Your dictionary contains #{dictionary.word_count} words."
      puts "Found the following matches per starting letter: "
      ("A".."Z").each do |letter|
        puts "#{letter}: #{DictionarySearcher.first_letter(dictionary,letter).count}"
      end
    end

    def display_options
      puts
      puts "What kind of search?"
      puts "#1: Exact"
      puts "#2: Partial"
      puts "#3: Begins With"
      puts "#4: Ends With"
      puts "'Q' or 'Quit': Quit program"
      begin 
        input = gets.chomp
        abort if quit?(input)
      end until [1, 2, 3, 4].include?(input.to_i)

      input
    end
    
# ask for filename
# load file
# display_statistics
# loop for UI (end condition: quit)
  # display_options
  # ask_for_choice
  # query based on choice
  # display_results
  # ask_save?
# end

end

d = DictionaryUI.new
d.run
require_relative 'dictionary_loader'
require_relative 'dictionary_analyzer'

class Dictionary

  def initialize
    puts "Welcome to the Dictionary Tool"
    if load?
      @dictionary_loader = DictionaryLoader.new
      @dictionary = @dictionary_loader.load('5desk.txt')
      @analyzer = DictionaryAnalyzer.new(@dictionary)
    else
      quit
    end
  end

  def menu
    selection = 1

    while (1..4).include?(selection)
      render_menu
      selection = gets.chomp.to_i
      @analyzer.run_search(selection)
    end
  end

  private

  def load?
    puts "Would you like to load the dictionary?  Type 'y' for yes and anything else to quit"
    gets.chomp == 'y' ? true : false
  end

  def quit
    puts "Have a nice day!"
  end

  def render_menu
    puts "What would you like to do next (enter number)?"
    puts "  1  exact-match search"
    puts "  2  partial-match search"
    puts "  3  begins-with search"
    puts "  4  ends-with search"
    puts "  5  quit"
    puts "(or enter anything else to quit)"
  end

   # Handles user interaction loop
   # The results should return the full word, regardless of match type.  Once the search is complete, display the number of matches and prompt the user whether to save the results to a file or display to the screen (puts). If saving to a file, prompt the user for the name of the file to save results to. If it already exists, ask whether to overwrite it or not.
   # Always give the user the option to quit.
end

d = Dictionary.new
d.menu

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
    loop do
      render_menu
      selection = gets.chomp.to_i
      if (1..4).include?(selection)
        @analyzer.run_search(selection)
      else
        quit
        break
      end
    end
  end

  private

  def load?
    puts "Would you like to load the dictionary?  Type 'y' for yes and anything else to quit."
    print " > "
    gets.chomp == 'y' ? true : false
  end

  def quit
    puts "Have a nice day!"
  end

  def render_menu
    puts "\n --- Menu -----------------------------"
    puts "What would you like to do next (enter number)?"
    puts "  1  exact-match search"
    puts "  2  partial-match search"
    puts "  3  begins-with search"
    puts "  4  ends-with search"
    puts "  5  quit"
    puts "(or enter anything else to quit)"
  end

end

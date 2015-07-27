require_relative 'dictionaryloader'
require_relative 'dictionaryanalyzer'

class Dictionary

  def main_loop
    #loop do
      render_heading
      dictionary = get_filename
      @analyzer = DictionaryAnalyzer.new(dictionary)
      
      render_heading
      render_stats

      type = get_search_type

      render_heading
      render_stats

      term = get_search_term

      # render_heading
      # render_stats

      @results = @analyzer.search(type.to_sym, term)

      choice = get_results_choice

      process_results(choice.to_sym, @results)
    #end
    
  end


  def render_stats
    puts "Your dictionary contains #{@analyzer.total_words} words!"
    puts "Count of words beginning with each letter:"

    index = 0
    @analyzer.word_count_by_letter.each do |ltr, count|
      print "\n" if index%4 == 0 && index != 0
      print "#{ltr.to_s}: #{count} "
      index += 1
    end
    print "\n\n"
  end


  def render_heading
    system 'clear'
    puts "Welcome to Dictionary Search!"
    puts "Enter 'q' at anytime to quit.\n\n"
  end


  def get_filename
    puts "Current directory"
    system "pwd"
    print "Please enter the filename of a dictionary > "
    begin
      # input = gets.chomp.downcase
      # exit if input.downcase == 'q' 
      DictionaryLoader.open("lib/5desk.txt")

    rescue 
      print "Error loading file (does it exist?) Try again > "
      retry

    end
  end


  def get_search_type
    input = ""

    puts "Please enter a type of search to perform"
    puts "e(x)act - 'apple' returns 'apple'"
    puts "(p)artial - 'apple' returns 'apple, grapple, applejack'"
    puts "(b)egins - 'apple' returns 'apple, applejack'"
    puts "(e)nds - 'apple' returns 'apple, grapple'"
    loop do
      print "> "
      input = gets.chomp.downcase
      exit if input == 'q'
      break if valid_search_type?(input)
    end

    input
  end

  def valid_search_type?(input)
    if ["x", "p", "b", "e"].include?(input)
      true
    else
      puts "Invalid search type!"
      false
    end
  end

  def get_search_term
    puts "OK! What word would you like to search for?"
    print "> " 
    input = gets.chomp.downcase
    exit if input == 'q'
    input
  end


  def get_results_choice
    input = ""

    puts "\nOK! the dictionary found #{@results.length} matches!"
    puts "Would you like to (v)iew the results or (s)ave them to a file?"

    loop do
      print "> "
      input = gets.chomp.downcase
      exit if input == 'q'
      break if valid_results_choice?(input)
    end

    input
  end


  def valid_results_choice?(input)
    if ["v", "s"].include?(input)
      true
    else
      puts "Invalid choice!"
      false
    end
  end



  def process_results(choice, results)
    print "\n"
    if choice == :v
      print_results(results)
    elsif choice == :s
      save_results
    end
  end


  def print_results(results)
    puts "Search Results:"    
    index = 0
    results.each do |word|
      print "\n" if index%5 == 0 && index != 0
      print "#{word} " 
      index += 1
    end
    print "\n\n"
  end



  def save_results
    input = ""

    loop do
      puts "Enter a filename to save the results to"
      print "> "
      input = gets.chomp.downcase
      exit if input == 'q'
      break if file_overwrite?(input)
    end

    @analyzer.output_results(input)
  end


  def file_overwrite?(filename)
    if File.exist?(filename)
      print "File already exists, overwrite? (y/n) > "
      input = gets.chomp.downcase
      exit if input == 'q'
      if input == "y"
        true
      elsif input == "n"
        false
      else 
        puts "Invalid choice!"
        false
      end
    else
      true
    end
  end



end

# d = Dictionary.new
# d.main_loop
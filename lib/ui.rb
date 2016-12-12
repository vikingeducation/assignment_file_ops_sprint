class DictionaryUI 

  #handles user interaction loop
  def initialize
    @loader = DictionaryLoader.new
  end

  def run
    prompt_for_path
    provide_statistics
    search? ? conduct_search : goodbye
    save_results? ? save : goodbye
    goodbye
  end

  def prompt_for_path
    puts puts
    puts "Where is your dictionary? ('q' to quit)"
    print "> "
    path = gets.chomp
    exit if path == 'q'
    @dictionary = Dictionary.new(@loader.load(path))
    puts "Dictionary was successfully loaded"
  end

  def provide_statistics
    puts puts
    puts "Your dictionary contains #{number_of_words} words."
    puts "Word frequency by starting letter:"
    words_by_starting_letter
  end

  def number_of_words(letter=0)
    return @dictionary.processed.size if letter == 0
    number = 0
    @dictionary.processed.each { |word| number += 1 if word.start_with?(letter)} 
    number
  end

  def words_by_starting_letter
    ("A".."Z").each do |letter|
      puts "#{letter}: #{number_of_words(letter.downcase)}"
    end
  end

  def search?
    puts puts
    puts "Would you like to search your dictionary? (y/n)"
    print "> "
    response = gets.chomp.strip.downcase
    until %(y n).include?(response)
      puts "Please enter 'y' for yes and 'n' for no."
      response = gets.chomp.strip.downcase
    end
    response == 'y' ? true : false
  end

  def conduct_search 
    puts puts
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With:"
    puts "4: Ends With:"
    print "> "
    type = gets.chomp.strip.to_i
    until (1..4).include?(type)
      puts "Please enter the number corresponding to the search you'd like to conduct."
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With:"
      puts "4: Ends With:"
      type = gets.chomp.strip.to_i
    end
    puts "Enter the search term:"
    print "> "
    term = gets.chomp.strip.downcase
    @results = @dictionary.search(type, term)
    display_results(@results)
  end

  def display_results(results)
    puts "Found #{results.size} matches:"
    puts results
  end

  def save_results?
    puts "Do you want to save results? (y/n)"
    print "> "
    response = gets.chomp.strip.downcase
    until %(y n).include?(response)
      puts "Please enter 'y' for yes and 'n' for no."
      response = gets.chomp.strip.downcase
    end
    response == 'y' ? true : false
  end

  def save
    get_filepath
    if @saver.file_exist?
      overwrite
    else 
      @saver.save
      puts "File has been saved!"
    end
  end

  def get_filepath
    puts "What filepath should we write results to?"
    print "> "
    path = gets.chomp.strip
    @saver = ResultsSaver.new(path, @results)
  end

  def overwrite
    puts "That file exists, overwrite? (y/n)"
    print "> "
    response = gets.chomp.strip.downcase
    until %(y n).include?(response)
      puts "Please enter 'y' for yes and 'n' for no."
      response = gets.chomp.strip.downcase
    end
    response == 'y' ? @saver.save : goodbye
    puts "File was successfully overwritten!"
  end


  def goodbye
    puts puts
    puts "Goodbye!"
    puts puts puts
    exit
  end







#class ends here
end
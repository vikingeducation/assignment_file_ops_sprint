
# DictionaryUI is the main class which handles the user interaction loop.

require "./dictionary_loader.rb"
require "./dictionary_searcher.rb"
require "./results_saver.rb"

class DictionaryUI
  def initialize
    system 'cls'
    system 'clear'
    locate
  end

  def locate
    puts "\nWhere is your dictionary?"
    puts " Please enter the file name and/or location in the following format"
    puts " path/to/myfile.extension"
    puts " Or enter q to quit in any prompt\n\n"
    input = gets.chomp
    quit?(input)
    load(input)
  end

  def quit?(input)
    exit if input == "q"
  end

  def load(path)
    if File.file?(path)
      @dictionary = DictionaryLoader.new(path).read.dictionary
      search_type
    else
      puts "\nFile not found, try entering again"
      locate
    end
  end

  def search_type
    puts "\nWhat kind of search would you like to do?"
    puts " Enter one of the numbers below to select the search type:"
    puts "1 - Exact\n2 - Partial\n3 - Begins With\n4 - Ends With\n\n"
    input = gets.chomp.strip
    quit?(input)
    type_check(input)
  end

  def type_check(input)
    options = ["1", "2", "3", "4"]
    if options.include?(input)
      @type = input
      search_term
    else
      puts "\n That wasn't one of the valid options, try again"
      search_type
    end
  end

  def search_term
    puts "\nWhat would you like to search for?"
    puts " (You can't input q to quit for this prompt so that it can be searched for)"
    puts ''
    input = gets.chomp
    check_term(input)
  end

  def check_term(input)
    if input == input.gsub(/[^a-z]/, '')
      @term = input.downcase
      search_results
    else
      puts "\n That's not a valid search term, try again"
      search_term
    end
  end

  def search_results
    @results = DictionarySearcher.new(@dictionary, @type, @term).results
    results_check
  end

  def results_check
    if @results.length == 0
      puts "\n No matches were found, try searching again"
      search_type
    else
      if @results.length == 1
        puts "\nFound a match: " + @results.to_s
      else
        puts "\nFound #{@results.length} matches:"
        puts @results
      end
        save
    end
  end

  def save
    puts "\nDo you want to save the results?"
    puts " Please enter y for yes or n for no, alternatively enter q to quit"
    puts ''
    input = gets.chomp
    quit?(input)
    save_check(input)
  end

  def save_check(input)
    case input
    when "y"
      place
    when "n"
      search_type
    else
      puts "\n Unable to interpret that input, try again"
      save
    end
  end

  def place
    puts "\nWhere should the results be stored in a file at?"
    puts " Please enter the file name and/or location in the following format"
    puts " path/to/myfile.extension\n\n"
    @where = gets.chomp
    quit?(@where)
    place_check
  end

  def place_check
    if File.file?(@where)
      write_mode
    else
      if Dir.exist?(@where)
        saving
      elsif Dir.exist?(File.dirname(@where))
        saving
      else
        puts "\n That file and/or path doesn't exist, try again"
        place
      end
    end
  end

  def write_mode
    puts "\nThat file aready exists, should it be overwritten?"
    puts " Please enter y for yes or n for no\n\n"
    input = gets.chomp.strip.downcase
    quit?(input)
    mode_check(input)
  end

  def mode_check(input)
    case input
    when "y"
      @overwrite = true
      saving
    when "n"
      @overwrite = false
      saving
    else
      puts "\n Unfortunately that was an invalid answer, try again"
      write_mode
    end
  end

  def saving
    @where = "#{@where}results.txt" if Dir.exist?(@where)
    ResultsSaver.new(@results, @where, @overwrite)
    search_type
  end
end

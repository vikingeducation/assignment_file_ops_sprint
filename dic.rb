# user interaction loop
class DictionaryUI
  def initialize
    # create dictionary
    @searcher = DictionarySearcher.new
    @dictionary
    @load = DictionaryLoader.new
    @input = ""
    @saver = ResultsSaver.new
  end

  def check_file(input)
    File.file?(input)
  end

  def quit_program(input)
    if input == "q"
      exit
    end
  end

  def run
    until check_file(@input)
      puts "Where is your dictionary? ('q' to quit)"
      @input = gets.chomp
      quit_program(@input)
    end
    @dictionary = @load.load_new(@input)
    loop do
      @searcher.search(@dictionary.dict_arr)
      @saver.interface(@searcher.output)
      @input = "q"
      break if quit_program(@input)
    end
  end
  #my_file.close
end

# loads DictionaryUI
class DictionaryLoader
  attr_accessor :loaded_dictionary

  def load_new(file_path)
    loaded_array = File.readlines(file_path)
    loaded_dictionary = Dictionary.new(loaded_array)
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{loaded_dictionary.num_words} words."
    loaded_dictionary
  end
end

# wraps the loaded DictionaryUI
class Dictionary
  def initialize(an_array)
    @dict_arr = an_array
  end

  def dict_arr
    @dict_arr
  end

  def num_words
    @dict_arr.length
  end
end

# analyzes Dictionary
class DictionarySearcher
  attr_accessor :input, :output

  def search(dictionary)
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
  #  @input = gets.chomp
  #  selection = @input.to_i
  selection = gets.chomp
    puts "Enter the search term"
#    @input = gets.chomp
  @input = gets.chomp
  @output = []
    if selection == 1
      dictionary.each do |term|
        if term == @input
          @output << term.chomp
        end
      end
    elsif selection == 2
      regex = /#{@input}/
      dictionary.each do |term|
        unless term.match(regex) == nil
          @output << term.chomp
        end
      end
    elsif selection == 3
      dictionary.each do |term|
        if term.start_with?(@input)
          @output << term.chomp
        end
      end
    elsif selection == 4
      dictionary.each do |term|
        rev_term = term.chomp.reverse
        rev_input = @input.reverse
        if rev_term.start_with?(rev_input)
          @output << term.chomp
        end
      end
    end
    dictionary.each do |term|
      #  @output << term.match(regex)
      #end
    end
    puts "#{output.length}"
    puts @output.to_s
    @output
  end

end

# takes a batch of results and writes them to a file
class ResultsSaver
  # def initialize
  #   @output = []
  # end
  def yes_no
    if gets.chomp == "y"
      true
    else
      false
    end
  end

  def interface(results)
    puts "Do you want to save results? y/n? 'q' quits."
    if yes_no
      puts "what filepath should we write results to?"
      filepath = gets.chomp
      output_file = File.open(filepath, "w")
      results.each {|result| output_file.write(result + "\n")}
      output_file.close
    end
  end



end

d = DictionaryUI.new
d.run

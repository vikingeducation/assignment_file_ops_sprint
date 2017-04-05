# user interaction loop
class DictionaryUI
  attr_accessor :my_file

  def check_file(input)
    File.file?(input)
  end

  def quit_program(input)
    if input == "q"
      exit
    end
  end

  def run
    num_words = 0
    input = ""
    # primary loop
    until check_file(input)
      puts "Where is your dictionary? ('q' to quit)"
      input = gets.chomp
      quit_program(input)
    end
    # This is where the fun begins
    # my_file = File.open(input, "r")
    dd = DictionaryLoader.new(input)
    puts dd.my_dict
    puts "Your dictionary contains #{num_words} words."
  end
  #my_file.close
end

# loads DictionaryUI
class DictionaryLoader
  def initialize(file_path)
    @my_dict = File.readlines(file_path)
  end

  def my_dict
    @my_dict
  end

  def load_new(file_path)
    arr = File.readlines(file_path)
    puts "Dictionary successfully loaded"
    puts arr
  end

end

# wraps the loaded DictionaryUI
class Dictionary
  def initialize(dict_arr)
    @dict_arr = dict_arr
  end

  def dict_arr
    @dict_arr
  end
end

# analyzes Dictionary
class DictionarySearcher

end

# takes a batch of results and writes them to a file
class ResultsSaver

end

d = DictionaryUI.new
d.run

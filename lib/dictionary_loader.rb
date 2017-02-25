# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.

require_relative 'dictionary'

class DictionaryLoader
  attr_accessor :dict_file

  def load
    dict_arr = read_file
    @dict_file = Dictionary.new(dict_arr)
  end

  def read_file
    arr = []
    file_lines = File.readlines("5desk.txt", "r") do |file|
      arr << line.strip
    end
    arr
  end


  def dict_loaded
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{@dict_file.num_words} words"
    puts "Word frequency by starting letter:"
    freq_letters = @dict_file.first_letter_count
    @dict_file.output_letter_freq(freq_letters)
  end

end




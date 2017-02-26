# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.

require_relative 'dictionary'

class DictionaryLoader
  attr_accessor :dict_file

  def load(file_path)
    dict_arr = read_file(file_path)
    @dict_file = Dictionary.new(dict_arr)
    output_dict_loaded
  end

  def read_file(file_path)
    arr = []
    File.readlines(file_path).each do |line|
      arr << line.strip
    end
    arr
  end


  def output_dict_loaded
    num_words = @dict_file.num_words
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{num_words} words"
    puts "Word frequency by starting letter:"
    freq_letters = @dict_file.first_letter_count
    @dict_file.output_letter_freq(freq_letters)
  end

end




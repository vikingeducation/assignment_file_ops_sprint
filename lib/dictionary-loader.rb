require_relative 'dictionary'

class DictionaryLoader

  attr_reader :dictionary

  def initialize(path)
    @path = path
    @dictionary = nil
  end

  def get_dictionary
    if valid_path?
      dict_arr = File.readlines(@path).each { |word| word.strip}
      @dictionary = Dictionary.new(dict_arr)
      success_message
    end
  end

  def valid_path?
    raise ArgumentError("Dictionary does not exist!") unless File.exists?(@path)
    true
  end

  def success_message
     puts "Dictionary successfully loaded"
     puts "Your dictionary contains #{@dictionary.num_words} words."
     puts "Word frequency by starting letter:"
    #  print @dictionary.word_frequency
     read_frequency
  end

  def read_frequency
    hash = @dictionary.word_frequency
    hash.each do |letter, frequency|
      puts "#{letter.upcase}: #{frequency}"
    end
  end
end

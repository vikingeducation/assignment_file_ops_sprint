# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.
require_relative 'dictionary'

class DictionaryLoader

  def initialize
    @dictionary = Dictionary.new
  end

  def load_file(file_location)
    mode = "r+"
    @dictionary.file = File.open(file_location, mode)
    return_statistics
    @dictionary.file.close
  end

  def return_statistics
    arr = @dictionary.file.readlines
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{arr.count} words."
    puts "Word frequency by starting letter:"
    # I want to first puts all letters
    ("A".."Z").each do |letter|
      count = 0
      arr.each do |word|
        if word.upcase[0] == letter
          count += 1
        end
      end
      puts "#{letter}: #{count}"
    end
  end
end
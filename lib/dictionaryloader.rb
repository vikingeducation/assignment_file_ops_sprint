# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.

# I take this to mean it's going to prepare the file into an array and close it up.
require_relative 'dictionary'

class DictionaryLoader

  def initialize
    @dictionary = Dictionary.new
  end

  def load_file(file_location)
    file_array = File.readlines(file_location)
    chomp_words(file_array)
    return_statistics
  end

  def chomp_words(file_array)
    file_array.each do |word|
      @dictionary.array << word.chomp
    end
  end

  def return_statistics
    arr = @dictionary.array
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
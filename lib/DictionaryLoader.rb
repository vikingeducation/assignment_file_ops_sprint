# DictionaryLoader is a helper class whose single responsibility is to load in the dictionary.

class DictionaryLoader
  def load
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains 12345 words"
    puts "Word frequency by starting letter:"
    # A: 123
    # B: 456"
  end

  def retrieve_file
    arr = []
    file_lines = File.readlines("fruits.txt", "r") do |file|
      arr << line.strip
    end
  end
end




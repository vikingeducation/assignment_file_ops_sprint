# helper class - single responsibility is to load dictionary

class DictionaryLoader

  def initialize(path)
    @path = path
    @dictionary_array = []
  end


  def load_file
    a_dictionary = File.readlines(@path)
    a_dictionary.each do |line|
      @dictionary_array << line.strip.upcase
    end
    dictionary_stats(@dictionary_array)
    return @dictionary_array
  end

  private

  def dictionary_stats(array)
    counts = Hash.new(0)
    array.each do |word|
      word.split("")
      counts[word[0]]+= 1
    end
    puts "Your dictionary contains #{@dictionary_array.length} words"
    puts "Word frequency by starting letter: "
    counts.each do |key, value|
      puts key.to_s + ":" + value.to_s
    end
  end

end

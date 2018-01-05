
=begin
 Dictionary is the class which wraps the loaded dictionary and has basic
 statistics about itself.
=end

class Dictionary
  attr_reader :dictionary

  def initialize(file)
    @dictionary = file
    count
  end

  def count
    puts "\nDictionary successfully loaded"
    puts "Your dictionary contains #{@dictionary.length} words"
    frequency
  end

  def frequency
    letters = { "a" => 0, "b" => 0, "c" => 0, "d" => 0, "e" => 0, "f" => 0,
                "g" => 0, "h" => 0, "i" => 0, "j" => 0, "k" => 0, "l" => 0,
                "m" => 0, "n" => 0, "o" => 0, "p" => 0, "q" => 0, "r" => 0,
                "s" => 0, "t" => 0, "u" => 0, "v" => 0, "w" => 0, "x" => 0,
                "y" => 0, "z" => 0 }
    @dictionary.each do |word|
      letters.each_pair { |key, value| letters[key] += 1 if word[0] == key }
    end
      puts "Word frequency by starting letter:"
      letters.each_pair { |key, value| puts "#{key.upcase}: #{value}" }
  end
end

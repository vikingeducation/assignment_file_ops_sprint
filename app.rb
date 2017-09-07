class DictionaryLoader
  #is a helper class whose single responsibility is to load in the dictionary.
  #perform the loading and processing of the specified dictionary file
  #before returning it as an instance of a Dictionary
  def initialize(location)
    @location = location
    $arr = File.readlines(@location)
    $arr = $arr.map do |str| str.strip end
  end


end

#require_relative "dictionary_loader.rb"

class DictionaryUI
  #is the main class which handles the user interaction loop.
  def initialize
  end

  def run
    puts "Where is your dictionary? ('q' to quit)"
    @input = gets.chomp
    $d = DictionaryLoader.new(@input)
    p "Dictionary successfully loaded"
    p "Your dictionary contains #{$arr.count} words."
    p "Word frequency by starting letter:"
    p "A: #{$arr.select{|word| word[0] == 'A' || word[0] == 'a'}.count}"
    p "B: #{$arr.select{|word| word[0] == 'B' || word[0] == 'b'}.count}"
    p "C: #{$arr.select{|word| word[0] == 'C' || word[0] == 'c'}.count}"
    p "D: #{$arr.select{|word| word[0] == 'D' || word[0] == 'd'}.count}"
    p "E: #{$arr.select{|word| word[0] == 'E' || word[0] == 'e'}.count}"
    p "F: #{$arr.select{|word| word[0] == 'F' || word[0] == 'f'}.count}"
    p "G: #{$arr.select{|word| word[0] == 'G' || word[0] == 'g'}.count}"
    p "H: #{$arr.select{|word| word[0] == 'H' || word[0] == 'h'}.count}"
    p "I: #{$arr.select{|word| word[0] == 'I' || word[0] == 'i'}.count}"
    p "J: #{$arr.select{|word| word[0] == 'J' || word[0] == 'j'}.count}"
    p "K: #{$arr.select{|word| word[0] == 'K' || word[0] == 'k'}.count}"
    p "L: #{$arr.select{|word| word[0] == 'L' || word[0] == 'l'}.count}"
    p "M: #{$arr.select{|word| word[0] == 'M' || word[0] == 'm'}.count}"
    p "N: #{$arr.select{|word| word[0] == 'N' || word[0] == 'n'}.count}"
    p "O: #{$arr.select{|word| word[0] == 'O' || word[0] == 'o'}.count}"
    p "P: #{$arr.select{|word| word[0] == 'P' || word[0] == 'p'}.count}"
    p "Q: #{$arr.select{|word| word[0] == 'Q' || word[0] == 'q'}.count}"
    p "R: #{$arr.select{|word| word[0] == 'R' || word[0] == 'r'}.count}"
    p "S: #{$arr.select{|word| word[0] == 'S' || word[0] == 's'}.count}"
    p "T: #{$arr.select{|word| word[0] == 'T' || word[0] == 't'}.count}"
    p "U: #{$arr.select{|word| word[0] == 'U' || word[0] == 'u'}.count}"
    p "V: #{$arr.select{|word| word[0] == 'V' || word[0] == 'v'}.count}"
    p "W: #{$arr.select{|word| word[0] == 'W' || word[0] == 'w'}.count}"
    p "X: #{$arr.select{|word| word[0] == 'X' || word[0] == 'x'}.count}"
    p "Y: #{$arr.select{|word| word[0] == 'Y' || word[0] == 'y'}.count}"
    p "Z: #{$arr.select{|word| word[0] == 'Z' || word[0] == 'z'}.count}"
  end

end

d = DictionaryUI.new
d.run

=begin
class Dictionary
  #is the class which wraps the loaded dictionary.
end

class DictionarySearcher
  #is an analysis class whose sole responsibility is to perform any analysis on the dictionary you provide it.
end

class ResultsSaver
  # takes a batch of results and writes them to a file.
end
=end

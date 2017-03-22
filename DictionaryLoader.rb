# DictionaryLoader.rb
require_relative 'Dictionary'

class DictionaryLoader
  attr_accessor :location
  def initialize(dictionary_location)
    @location = dictionary_location
  end

  def load_it
    dictionary = Dictionary.new(@location)
    File.open(@location, 'r') do |f|
      f.each_line do |line|
        word = line.chomp
        letter = word[0,1].upcase
        #  puts "#{word} #{letter}"
        dictionary.words.push(word)
        if dictionary.stats.key?(letter)
          dictionary.stats[letter] += 1
        else
          dictionary.stats[letter] = 1
      end
      end
    end
    # IO.foreach('5desk.txt') do |line|
    # en
    dictionary.length = dictionary.words.length - 1
    puts 'Loading Dictionary'
    puts 'Contains ' + dictionary.length.to_s + ' words'
    puts 'Word freq by letter:'
    dictionary.stats.each do |key, value|
      puts "#{key}:#{value}"
    end
    dictionary
  end
end

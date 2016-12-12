require_relative 'loader'

class DictionaryUI 

  #handles user interaction loop
  def initialize
    @loader = DictionaryLoader.new
  end

  def run
    prompt_for_path
    provide_statistics
  end

  def prompt_for_path
    puts puts
    puts "Where is your dictionary? ('q' to quit)"
    print "> "
    path = gets.chomp
    exit if path == 'q'
    @dictionary = Dictionary.new(@loader.load(path))
    puts "Dictionary was successfully loaded"
  end

  def provide_statistics
    puts puts
    puts "Your dictionary contains #{number_of_words} words."
    puts "Word frequency by starting letter:"
    words_by_starting_letter
  end

  def number_of_words(letter=0)
    return @dictionary.size if letter == 0
    number = 0
    @dictionary.each { |word| number += 1 if word.start_with?(letter)} 
    number
  end

  def words_by_starting_letter
    ("A".."Z").each do |letter|
      puts "#{letter}: #{number_of_words(letter.downcase)}"
    end
  end







#class ends here
end

a = DictionaryUI.new
a.run
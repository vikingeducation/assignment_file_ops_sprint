class Dictionary

  def initialize

    dict = Dictionary_Loader.new("5desk.txt")

    dictionary = dict.load if get_input?

    analyzer = DictionaryAnalyzer.new(dictionary)

    analyzer.word_count

    analyzer.beginning_letter_count

    analyzer.search

  end

  def get_input?
    puts "Would you like to load the dicitonary? (Y) for yes."
    input = gets.chomp.upcase
    true if input == 'Y'
  end




end

class Dictionary_Loader

  def initialize(file)

    @file = file

  end

  def load

   dict = File.open(@file, "r")
   dict.read
  end


end

class DictionaryAnalyzer

  def initialize(dictionary)

    @dictionary = dictionary

  end


  def word_count

    count = @dictionary.scan(/\n/).length
    puts "There are #{count} words in this dictionary"

  end


  def beginning_letter_count

    letters = {}
    string = @dictionary
    ("a".."z").each do |letter|

      regex = /^#{letter}|^#{letter.upcase}/
      letters[letter] = string.scan(regex).length

    end

    letters

  end

  def search

    get_type


  end

  def get_type

    puts "What type of search?"
    puts "1. Exact matches"
    puts "2. Partial matches"
    puts "3. Begins with"
    puts "4. Ends with"

    input = 0
    until (1..4).include?(input)
      input = gets.chomp.to_i
    end

    input

  end

end



dictionary = Dictionary.new















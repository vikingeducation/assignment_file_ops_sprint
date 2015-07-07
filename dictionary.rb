class Dictionary

  def initialize

    dict = Dictionary_Loader.new("5desk.txt")

    dictionary = dict.load if get_input?

    analyzer = DictionaryAnalyzer.new(dictionary)

    analyzer.word_count

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
   return dict.read
   dict.close



  end


end

class DictionaryAnalyzer

  def initialize(dictionary)

    @dictionary = dictionary

  end


  def word_count
    regex = /\n/
    string = @dictionary
    our_match = string.captures(regex)

    p our_match

  end


  def beginning_letter_count

  end

end



dictionary = Dictionary.new















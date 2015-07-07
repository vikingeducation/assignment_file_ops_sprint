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
    input = 'Y' #gets.chomp.upcase
    true if input == 'Y'
  end




end

class Dictionary_Loader

  def initialize(file)

    @file = file

  end

  def load

   dict = File.open(@file, "r")
   dict.read.gsub("\r\n", " ")

   
  end


end

class DictionaryAnalyzer

  def initialize(dictionary)

    @dictionary = dictionary

  end


  def word_count

    count = @dictionary.scan(/\s/).length
    puts "There are #{count} words in this dictionary"

  end


  def beginning_letter_count

    letters = {}
    string = @dictionary
    ("a".."z").each do |letter|

      regex = /\b#{letter}/i
      letters[letter] = string.scan(regex).length

    end

    letters

  end

  def search

    num = get_type

    case 

    when num == 1
      exact_match
    when num == 2
      partial_match
    when num == 3
      begin_match
    when num == 4 
      end_match

    end

    save()


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

  def exact_match

    word = gets.chomp
    regex = /\b#{word}\b/i
    matches = @dictionary.scan(regex)

    puts matches

    puts "There are #{matches.length} match(es)"

    matches

    

  end

  def partial_match

    word = gets.chomp
    regex = /\S*#{word}\S*/i   # ab    cab

    puts regex
    matches = @dictionary.scan(regex)
    
    puts matches

    puts "There are #{matches.length} match(es)"

    
    matches

  end

  def begin_match

    word = gets.chomp
    regex = /\b#{word}\S*/i
    matches= @dictionary.scan(regex)

    puts matches

    puts "There are #{matches.length} match(es)"

    matches


  end

  def end_match

    word = gets.chomp
    regex = /\S*#{word}\b/i

    matches= @dictionary.scan(regex)

    puts matches

    puts "There are #{matches.length} match(es)"

    matches

  end

  def save




  end

end



dictionary = Dictionary.new















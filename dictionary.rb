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

    case num

    when 1
      results = exact_match
    when 2
      results = partial_match
    when 3
      results = begin_match
    when 4
      results = end_match

    end

    save(results)


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
    regex = /\S*#{word}\S*/i

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

  def save(results)

    puts "Would you like to store the results?"

    input = gets.chomp.downcase

    until ["y", "n"].include?(input[0])
      puts "type 'y' or 'n'"
      input = gets.chomp.downcase
    end

    if input == "y"
      puts "What should the file be named? (without extension)"
      file_name = gets.chomp + ".txt"
      file = File.open(file_name, "w")
      file.write(results.join("\n"))
    end

  end

end



dictionary = Dictionary.new















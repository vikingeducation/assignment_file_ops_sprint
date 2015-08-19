class Dictionary

  def initialize

    test = DictionaryLoader.new('5desk.txt')
    dictionary = test.load
    

    dictionary_analyzer = DictionaryAnalyzer.new(dictionary)
    dictionary_analyzer.word_count
    dictionary_analyzer.beginning_letter_count
    dictionary_analyzer.search

  end

end

class DictionaryLoader

  def initialize(file)
    @file = file
  end

  def load
    dictionary = File.open(@file, "r")
    dictionary.read.gsub("\r\n", " ")
  end

end

class DictionaryAnalyzer

  def initialize(dictionary)

    @dictionary = dictionary

  end

  def word_count

    count = @dictionary.scan(/\s/).length
    puts "Word Count: #{count} words"

  end

  def beginning_letter_count

    letters = {}
    ("a".."z").each do |letter|

      regex = /\b#{letter}/i
      letters[letter] = @dictionary.scan(regex).length
    end

    letters
  end

  def get_search_type

    puts "What type of search do you want to make?"
    puts "1: Exact Match"
    puts "2: Partial Match"
    puts "3: Begins with"
    puts "4: Ends with"

    input = gets.chomp.to_i
    until (1..4).include?(input)
      puts "Please input a valid option!"
      input = gets.chomp.to_i
    end

    input
  end

  def search

    search_type = get_search_type

    case search_type

    when 1
      result = exact_match

    when 2
      result = partial_match

    when 3
      result = begins_with

    when 4
      result = ends_with
    end

    save(result)
  end

  def exact_match

    word = gets.chomp

    regex = /\b#{word}\b/i
    matches = @dictionary.scan(regex)

    puts matches
    puts "There are #{matches.length} matches."

    matches

  end

  def partial_match

    word = gets.chomp

    regex = /\S*#{word}\S*/i
    matches = @dictionary.scan(regex)

    puts matches
    puts "There are #{matches.length} matches."

    matches

  end

  def begins_with

    word = gets.chomp

    regex = /\b#{word}\S*/i
    matches = @dictionary.scan(regex)

    puts matches
    puts "There are #{matches.length} matches."

    matches

  end

  def ends_with

    word = gets.chomp

    regex = /\S*#{word}\b/i
    matches = @dictionary.scan(regex)

    puts matches
    puts "There are #{matches.length} matches."

    matches

  end

  def save(result)

    puts "Would you like to save the results?"

    input = gets.chomp.downcase
    quit if input == "q"

    until["y", "n"].include?(input[0])
      puts "Input either 'y' or 'n'"
      input = gets.chomp.downcase
      q if input == 'q'
    end

    if input == 'y'
      puts "Enter a file name"
      file_name = gets.chomp + ".txt"
      if File.exist?(file_name)
        puts "File already exists, would you like to overwrite? (Y/N)"
        overwrite = gets.chomp.downcase
        until ['y','n'].include?(overwrite)
          puts "Please input a valid option (Y/N)"
          overwite = gets.chomp.downcase
        end

        if overwrite == 'y'
          file = File.open(file_name, "w")
          file.write(result.join("\n"))
        end

      else
        file = File.open(file_name, "w")
        file.write(result.join("\n"))
      end

    end

  end

end

dictionary = Dictionary.new
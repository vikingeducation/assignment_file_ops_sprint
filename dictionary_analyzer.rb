class DictionaryAnalyzer

  def initialize(dictionary)
    @dictionary = dictionary
    show_statistics
  end

  def run_search(selection)
    search_text = get_text

    case selection
    when 1
      result = exact_match_search(search_text)
    when 2
      result = partial_match_search(search_text)
    when 3
      result = begins_with_search(search_text)
    when 4
      result = ends_with_search(search_text)
    end

    output(search_text, result)
  end

  private

  def show_statistics
    puts "\n --- Statistics -----------------------"
    total_words
    words_by_letter
  end

  def total_words
    puts "Total word count is #{@dictionary.size}."
  end

  def words_by_letter
    letters = ('a'..'z').to_a
    results = []

    letters.each do |letter|
      word_count = @dictionary.count{ |word| word.downcase[0] == letter }
      results << "#{letter}: #{word_count}"
    end

    puts "Word counts by starting letter:"
    puts results.join(', ')
  end

  def get_text
    print "Enter search string > "
    gets.chomp
  end

  def exact_match_search(string)
    [@dictionary.find{ |word| word == string }]
  end

  def partial_match_search(string)
    @dictionary.find_all{ |word| word.include?(string) }
  end

  def begins_with_search(string)
    letter_count = string.size
    @dictionary.find_all{ |word| word[0, letter_count] == string }
  end

  def ends_with_search(string)
    letter_count = string.size
    start = - letter_count
    @dictionary.find_all{ |word| word[start, letter_count] == string }
  end

  def output(string, result)
    puts "\n --- Results --------------------------"
    puts "Your search string was '#{string}', which returned #{result.size} result(s)."
    output_location = get_output_location
    if output_location == 1
      puts result.join(', ')
    else
      save_to_file(result)
    end
  end

  def get_output_location
    loop do
      puts "Would you like to output the result(s) to the screen (1) or save them to a file (2)?"
      print "Type 1 or 2 > "
      selection = gets.chomp.to_i
      if selection == 1 || selection == 2
        return selection
      else
        print " I'm sorry, I don't recognize that response."
      end
    end
  end

  def save_to_file(result)
    filename = get_filename

    File.open(filename, 'w') do |file|
      file.write result.join("\n")
    end

    puts "Saved successfully!"
  end

  def get_filename
    loop do
      print "Enter the file name > "
      name = gets.chomp
      if File.file?(name)
        puts "That file already exists. Would you like to overwrite it?"
        print "Type y or n > "
        overwrite = gets.chomp
        return name if overwrite == 'y'
      else
        return name
      end
    end
  end

end
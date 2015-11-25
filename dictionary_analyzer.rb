require 'pry'

class DictionaryAnalyzer

  def initialize(dictionary)
    @dictionary = dictionary
    show_statistics
  end

   # The results should return the full word, regardless of match type.  Once the search is complete, display the number of matches and prompt the user whether to save the results to a file or display to the screen (puts). If saving to a file, prompt the user for the name of the file to save results to. If it already exists, ask whether to overwrite it or not.

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
    puts "Your search string was '#{string}', which returned #{result.size} result(s):"
    puts result.join(', ')
  end

end
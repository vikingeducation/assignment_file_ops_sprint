class DictionaryAnalyzer

  attr_reader :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
    puts "total word count: #{@dictionary.length}"
    print_word_count_summary
  end

  def print_word_count_summary
    first_letter_counter.each do |count|
      puts "#{count[0]}: #{count[1]}"
    end
  end

  def first_letter_counter
    @dictionary.each_with_object(initial_letter_hash) do |word, word_count_by_letter|
      first_letter = word[0].upcase
      word_count_by_letter[first_letter] += 1
    end
  end

  def initial_letter_hash
    ("A".."Z").each_with_object({}) do |letter, letter_count|
      letter_count[letter] = 0
    end
  end

  def template_search
    @dictionary.select do |entry|
      entry =~ yield
    end
  end

  def exact_match(search_string)
    template_search { /^#{search_string}$/ }
  end

  def partial_match(search_string)
    template_search { /#{search_string}/ }
  end

  def begins_with_match(search_string)
    template_search { /^#{search_string}/ }
  end

  def ends_with_match(search_string)
    template_search { /#{search_string}$/ }
  end

  def search(search_style,search_string)
    case search_style
    when 1
      exact_match search_string
    when 2
      partial_match search_string
    when 3
      begins_with_match search_string
    when 4
      ends_with_match search_string
    end
  end
end

# Next allow the user to perform one of four types of searches: exact matches, partial matches, "begins with" and "ends with". The results should return the full word, regardless of match type.

# Once the search is complete, display the number of matches and prompt the user whether to save the results to a file or display to the screen (puts).
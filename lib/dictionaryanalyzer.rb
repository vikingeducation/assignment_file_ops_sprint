class DictionaryAnalyzer
  def initialize(dictionary_input)
    word_count(dictionary_input)
    letter_data(dictionary_input)
  end

  def word_count(input)
    answer = input.length
    puts "There are #{answer} words in this dictionary.\n"
  end

  def letter_data(input)
    ("a".."z").each do |regex|
      regex_big = regex.upcase
      letter_count = letter_counter_helper(input, regex) #(input.to_s.scan(/^regex/).size + input.to_s.scan(/^regex_big/).size) #regex hates me
      puts "There are #{letter_count} words under the letter #{regex}"
    end
  end

  def letter_counter_helper(ary, letter_to_check)
    counter = 0
    ary.each do |word|
      if word[0].upcase == letter_to_check.upcase
        counter += 1
      end
    end
    return counter
  end
end
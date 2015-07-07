class DictionaryAnalyzer
  attr_reader :stats

  def initialize(dictionary)
    @dictionary = dictionary
    @stats = {}

    run_analyze
  end


  private


  def run_analyze
    @stats[:word_count] = word_count
    @stats[:word_count_by_letter] = word_count_by_letter
  end


  def word_count
    @dictionary.count
  end


  def word_count_by_letter
    # run words_starting_with for a..z
    by_letter_counts = {}

    ('a'..'z').each do |letter|
      by_letter_counts[letter.to_sym] = words_starting_with(letter)
    end

    by_letter_counts
  end


  def words_starting_with(letter)
      downcase_dictionary = @dictionary.map { |entry| entry.downcase }
      count = 0

      #downcase_dictionary.count(/[#{letter}][a-z]*/)
      downcase_dictionary.each do |entry|
        count += 1 if entry[0] == letter
      end

      count
  end

end
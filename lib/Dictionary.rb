class Dictionary
  def initialize(words)
    @words = words
  end
  attr_reader :words
  def word_count
    @words.length
  end
  def words_by_letter
    @words.each_with_object({}) do |word, letters_key|
      first_letter = word[0].upcase
      letters_key[first_letter] ||= []
      letters_key[first_letter] << word
      # p letters_key[first_letter]
    end
  end
end

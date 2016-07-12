#Dictionary

class Dictionary
  def initialize(word_bank)
    @word_bank = word_bank
  end

  def stats
    stats_hash = {}
    stats_hash[:word_count] = word_count
    stats_hash[:words_by_starting_letter]=words_by_starting_letter
    stats_hash
  end

  def word_count
    @word_bank.length
  end

  def words_by_starting_letter
    letter_hash=Hash.new(0)
    @word_bank.each do |word|
      letter_hash[word.downcase[0]] +=1
    end
    letter_hash
  end
end

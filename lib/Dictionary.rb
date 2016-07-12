#Dictionary

class Dictionary
  def initialize(word_bank)
    @word_bank = word_bank
  end

  def stats
    stats_hash = {}
    stats_hash[:word_count] = word_count
  end

  def word_count
    @word_bank.length
  end
end

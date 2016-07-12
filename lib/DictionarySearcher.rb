#DictionarySearcher
class DictionarySearcher
  def initialize(dictionary)
    @dict=dictionary
    @word_bank = dictionary.word_bank
  end

  def exact_matches(query)
    @word_bank.select{|word| word.downcase==query.downcase}
  end

  def partial_matches(query)
    @word_bank.select{|word| /#{query.downcase}/.match(word.downcase)}
  end

  def begins_with_matches(query)
    @word_bank.select{ |word| /\A#{query.downcase}/.match(word.downcase) }
  end

  def ends_with_matches(query)
    @word_bank.select { |word| /#{query.downcase}\z/.match(word.downcase) }
  end
end

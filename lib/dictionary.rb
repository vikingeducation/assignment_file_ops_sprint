class Dictionary
  attr_reader :dict_arr
  def initialize(dict_arr)
    @dict_arr = dict_arr
  end

  def num_words
    @dict_arr.length
  end

  def word_frequency
    hash = Hash.new(0)
    @dict_arr.each do |word|
      letter = word[0].downcase
      hash[letter] += 1
    end
    hash
  end


end

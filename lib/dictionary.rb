class Dictionary

  def initialize(dict_arr)
    @dict_arr = dict_arr
  end

  def num_words
    @dict_arr.length
  end

  def word_frequency
    hash = Hash.new
    @dict_arr.each do |word|
      letter = word[0].downcase
      hash[letter] ? hash[letter] += 1 : hash[letter] = 1
    end
    hash
  end


end

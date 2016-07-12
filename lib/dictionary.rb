class Dictionary

  def initialize(dict_arr)
    @dict_arr = dict_arr
  end

  def num_words
    @dict_arr.length
  end

  def word_frequency
    hash = Hash.new(0)
    @dict_arr.each do |word|
      hash[word[0]] += 1
    end
  end


end

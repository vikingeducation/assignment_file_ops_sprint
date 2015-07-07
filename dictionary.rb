class Dictionary
  
  attr_reader :dic

  def initialize
    @dic=DictionaryLoader.new.dic
    dic_analyzer = DictionaryAnalyzer.new(@dic)
    puts dic_analyzer.word_count
    puts dic_analyzer.count_words_beg_with("a")
    puts dic_analyzer.exact_match("apple")

  end

end

class DictionaryLoader
  attr_reader :dic
  def initialize(filename="5desk.txt")
    @dic=File.readlines(filename)
    @dic.map! {|word| word.chomp}

  end


end

class DictionaryAnalyzer
  attr_reader :dictionary
  def initialize(dictionary)
    @dictionary=dictionary
  end

  def word_count
    # @dictionary
    @dictionary.length
  end

  def count_words_beg_with(letter)
    @dictionary.select {|word| word[0].downcase == letter.downcase}.length
  end

  def exact_match(word)
    @dictionary.include?(word.downcase) ? word.downcase : false
  end

  def partial_match(word)
    
  end

end
d = Dictionary.new
# dic_arr = DictionaryAnalyzer.new(Dictionary.new.dic)
# puts dic_arr.count_words_beg_with("a")

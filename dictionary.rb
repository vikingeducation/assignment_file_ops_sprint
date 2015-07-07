class Dictionary
  attr_reader :dic

  def initialize
    @dic=DictionaryLoader.new.dic
  end

end

class DictionaryLoader
  attr_reader :dic
  def initialize(filename="5desk.txt")
    @dic=File.readlines(filename)
    
  end


end

class DictionaryAnalyzer
  attr_reader :dictionary
  def initialize(dictionary)
    @dictionary=dictionary
  end

  def word_count
    @dictionary.length

  end

end

puts DictionaryAnalyzer.new(Dictionary.new.dic).word_count


class Dictionary

  def initialize
    @dict = []
  end

  def get_dictionary(filename)
    @dict = DictionaryLoader.new(filename).dict
    @dict = DictionaryAnalyzer.new(@dict)
  end

  def print_stats
    puts @dict.word_count
    puts @dict.words_starting_with("a")
    #puts @dict.partial_match("ab")
    #puts @dict.begins_with("ab")
    puts @dict.ends_with("re")

  end

  def load_file
    puts "Enter the file name"
    filename = gets.chomp
    get_dictionary(filename) if File.exist? (filename)
  end
end

class DictionaryLoader

  attr_reader :dict

  def initialize(filename)
    @dict = read_from_file(filename)
  end

  def read_from_file(filename)
    File.readlines(filename) do |line|
      line.chomp
    end
  end

end

class DictionaryAnalyzer

  def initialize(dict)
    @dict = dict
  end

  def word_count
    @dict.length
  end

  def words_starting_with(letter)
    @dict.select{|word| word[0].downcase == letter.downcase}.length
  end

  def exact_match(word)
    (@dict.include?(word.downcase)||@dict.include?(word.capitalize)) ? word : false
  end

  def partial_match(input)
    input = input.downcase
    return @dict.reject{|word| (/#{input}/ =~ word.downcase).nil?}
  end

  def begins_with(input)
    input = input.downcase
    return @dict.reject{|word| (/^#{input}/ =~ word.downcase).nil?}
  end

  def ends_with(input)
    input = input.downcase
    return @dict.reject{|word| (/.*#{input}$/ =~ word.downcase).nil?}
  end



end

dict = Dictionary.new
dict.load_file
dict.print_stats
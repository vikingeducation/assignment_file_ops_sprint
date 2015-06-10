require './dictionary_loader'
require './dictionary_analyzer'


class Dictionary

  def initialize(filename = "")
    if filename.empty?
      puts "Enter the name & extension of your dictionary file:"
      print " > "
      filename = gets.chomp
    end

    load(filename)
  end


  def load(filename)
    @loader = DictionaryLoader.new(filename)
    @dictionary = @loader.dictionary
  end


  def analyze
    @analyzer = DictionaryAnalyzer.new(@dictionary)
    puts "Total word count: #{@analyzer.stats[:word_count]}"
    @analyzer.stats[:word_count_by_letter].each do |key, value|
      puts "#{key.to_s.upcase}: #{value}"
    end
  end

end
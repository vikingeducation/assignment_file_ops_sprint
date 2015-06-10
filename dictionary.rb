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
      print "#{key.to_s.upcase}: #{value}\t"
    end
  end


  def search_exact(word)
    output = []

    @dictionary.each do |entry|
      output << entry if entry.match(/^#{word}$/i)
    end

    output
  end


  def search_partial(substring)
    output = []

    @dictionary.each do |entry|
      output << entry if entry.match(/^.*#{substring}.*$/i)
    end

    output
  end


  def search_begins_with(substring)
    output = []

    @dictionary.each do |entry|
      output << entry if entry.match(/^#{substring}.*$/i)
    end

    output
  end


  def search_ends_with(substring)
    output = []

    @dictionary.each do |entry|
      output << entry if entry.match(/^.*#{substring}$/i)
    end

    output
  end

end
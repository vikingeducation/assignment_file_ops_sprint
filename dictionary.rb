class Dictionary

  attr_reader :file_name

  def initialize

    @file_name = ''
    @loader = DictionaryLoader.new
    @dict = []

  end

  def choose_file

    puts "Enter the file name you want to read:"
    @file_name = gets.chomp
    @dict = @loader.load_file(@file_name)

  end

  def analyze_dictionary

    analyzer = DictionaryAnalyzer.new(@dict)
    analyzer.initial_analysis

  end

end


class DictionaryLoader

  def load_file(file)

    dict = File.readlines(file)
    dict.map {|line| line.strip!}
    dict

  end

end


class DictionaryAnalyzer

  def initialize(dict)

    @dict = dict

  end

  def initial_analysis

    dict_string = @dict.join(" ")
    regex = /^(a|A)/

    a_array = dict_string.scan(regex)
    a_array.lenght

    
    puts "This dictionary contains #{@dict.lenght} words"
    puts "This dictionary contains:"

    end





  end


  
end












class Dictionary

  attr_reader :file_name

  def initialize

    @file_name = ''
    @loader = DictionaryLoader.new
    @dict = []
    user_interaction

  end

  def user_interaction

    choose_file
    analyze_dictionary
    search_dictionary

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

  def search_dictionary

    type = type_search

    puts "What do you want to search"
    search_term = gets.chomp

    if type == 'e'
      regex = /#{search_term}/i
    elsif type == 'p'
      regex = /\w*#{search_term}\w*/i
    elsif type == 'b'
      regex = /^#{search_term}\w*/i
    else
      regex = /\w*#{search_term}$/i
    end

    match(regex)

    puts "the end"
  end

  def type_search

    puts "What kind of search do you want to do? exact(e), partial(p), begins with(b), ends with(ew)"
    type = gets.chomp
    return type if ['e', 'p', 'b', 'ew'].include?(type)

  end

  def match(regex)

    arr = @dict.select {|word| !!(word =~ regex)}

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

    puts "This dictionary contains #{@dict.length} words"

    # dict_string = @dict.join(" ") + ' '
    
    # ('a'..'z').each do |l|
    #   regex = Regexp.new("(#{l}|#{l.upcase})[a-zA-Z]*\\s")
    #   array = dict_string.scan(regex)
    #   puts "This dictionary contains #{array.length} words starting with letter #{l}."
    # end


    ('a'..'z').each do |l|

      regex = Regexp.new("^#{l}",true)

      n = @dict.count {|word| !!(word =~ regex)}

      puts "This dictionary contains #{n} words starting with letter #{l}."

    end


    end

end












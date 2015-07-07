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

end


class DictionaryLoader

  def load_file(file)

    dict = File.readlines(file)
    dict.map {|line| line.strip!}
    dict

  end

end


class DictionaryAnalyzer

  
end












require_relative 'dictionary'
require_relative 'dictionaryloader'
require_relative 'dictionarysearcher'
require_relative 'resultssaver'
require_relative 'view'


class DictionaryUI
  attr_accessor :mode, :file_path, :matches, :dictionary, :num_of_entries, :frequencies_hash, :results, :input_num, :input_query
  def initialize
    @dictionary
    @num_of_entries
    @frequencies_hash
    @results = {}
    @input_num
    @input_query
    @matches
    @mode
    @file_path
  end

  def run
    View.where_dict
    file_path = gets.chomp
    @dictionary = Dictionary.wrap(DictionaryLoader.load(file_path))
    arr = DictionarySearcher.quick_stats(@dictionary)
    View.load_success(arr)
    loop do
      View.search_num
      @input_num = gets.chomp.to_i
      break if @input_num == "q"
      View.search_query
      @input_query = gets.chomp
      @matches = method_return(@input_num)
      puts @matches
      View.save
      response = gets.chomp
      break if response == "q"
      if response == "y"
        View.filepath
        @file_path = gets.chomp
        View.overwrite
        @mode = "w"
        @mode = "a" if gets.chomp == "n"
        ResultsSaver.save(@input_num, @input_query, @matches)
        ResultsSaver.export(@file_path, @mode)
        View.written
      end
    end
  end

  def method_return(input)
    if input == 1
      DictionarySearcher.exact?(@input_query, @dictionary)
    elsif input == 2
      DictionarySearcher.partial(@input_query, @dictionary)
    elsif input == 3
      DictionarySearcher.begins_with(@input_query, @dictionary)
    elsif input == 4
      DictionarySearcher.ends_with(@input_query, @dictionary)
    end
  end


end

g = DictionaryUI.new
g.run

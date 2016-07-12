require_relative 'dictionary'
require_relative 'dictionaryloader'
require_relative 'dictionarysearcher'
require_relative 'dictionarysaver'
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
    View.load_success(DictionarySearcher.quick_stats)
    loop do
      View.search_num
      @input_num = gets.chomp
      break if @input_num == "q"
      View.search_query
      @input_query = gets.chomp
      @matches = method_return
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

  def method_return
    if @input_num == 1
      DictionarySearcher.exact?(@input_query, @dictionary)
    elsif @input_num == 2
      DictionarySearcher.partial(@input_query, @dictionary)
    elsif @input_num == 3
      DictionarySearcher.begins_with(@input_query, @dictionary)
    elsif @input_num == 4
      DictionarySearcher.ends_with(@input_query, @dictionary)
    end
  end


end

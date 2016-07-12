require 'dictionary'
require 'dictionaryloader'
require 'dictionarysearcher'
require 'dictionarysaver'
require 'view'


class DictionaryUI
  attr_accessor :mode, :file_path :matches, :dictionary, :num_of_entries, :frequencies_hash, :results, :input_num, :input_query
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
    DictionaryLoader.load(file_path)
    View.load_success(DictionarySearcher.quick_stats)
    View.search_num
    @input_num = gets.chomp
    View.search_query
    @input_query = gets.chomp
    @matches = method_return
    puts @matches
    View.save


  end

  def method_return
    if @input_num == 1
      DictionarySearcher.exact?(@input_query)
    elsif @input_num == 2
      DictionarySearcher.partial(@input_query)
    elsif @input_num == 3
      DictionarySearcher.begins_with(@input_query)
    elsif @input_num == 4
      DictionarySearcher.ends_with(@input_query)
    end
  end


end

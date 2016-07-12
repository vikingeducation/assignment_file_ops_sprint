require 'dictionary'
require 'dictionaryloader'
require 'dictionarysearcher'
require 'dictionarysaver'


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




end

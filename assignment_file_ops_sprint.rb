# Dictionary Search

# assignment_file_ops_sprint

require 'pry'

require './dictionary_UI'
require './dictionary_loader'
require './dictionary'
require './dictionary_searcher'
require './results_saver'

include File_operations

dictionary = DictionaryUI.new
dictionary.search_regex


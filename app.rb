

#require_relative "dictionary_loader.rb"

require_relative "dictionary_ui.rb"

require_relative "dictionary_searcher.rb"

require_relative "results_saver.rb"

#for the main page
d = DictionaryUI.new
d.run





#for the main page
start = DictionarySearcher.new
start.searcher


startsaving = ResultsSaver.new
startsaving.getresponse
startsaving.conditional

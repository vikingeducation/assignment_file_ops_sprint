class DictionaryUI
	require './dictionary_loader'
	require './dictionary'
	require './dictionary_searcher'
	def initialize
	end

	def run
		puts "Please enter the location of your dictionary file? ('q' to quit)"
		file_location = './dictionary.txt'
		dictionary = DictionaryLoader.load(file_location)
		dictionary.word_count
		dictionary.frequency
		ds = DictionarySearcher.new(dictionary)
		search_type = ds.ask_search
		search_term = ds.ask_term
		ds.search(search_type, search_term)
	end
end

d = DictionaryUI.new
d. run

class DictionaryUI
	require './dictionary_loader'
	require './dictionary'
	require './dictionary_searcher'
	require './results_saver'
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
		search_results = ds.search(search_type, search_term)
		puts "Do you want to save results? y/n? 'q' quits."
		save = gets.chomp.downcase
		if save == "y"
			rs = ResultsSaver.new(search_results)
			rs.how_save
		else
			puts "Thanks for using this program."
		end
	end
end

d = DictionaryUI.new
d. run

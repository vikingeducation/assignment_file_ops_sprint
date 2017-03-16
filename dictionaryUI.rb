class DictionaryUI
	require './dictionary_loader'
	require './dictionary'

	def initialize
	end

	def run
		puts "Please enter the location of your dictionary file? ('q' to quit)"
		file_location = './dictionary.txt'
		dictionary = DictionaryLoader.load(file_location)
		dictionary.word_count
		dictionary.frequency
	end
end

d = DictionaryUI.new
d. run

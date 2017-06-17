require_relative 'dictionary.rb'
require_relative 'dictionarysearcher.rb'

class DictionaryUI      # user interaction loop
	attr_accessor :dictionary

	def initialize 
		@dictionary = []
	end 

	def run
		puts "Welcome to the Dictionary Search Tool" 
		set_up_dictionary
		search_for_something
	end 



	private

	def set_up_dictionary 
		@dictionary = Dictionary.new.get_word_array
	end

	def search_for_something 
		search_request = DictionarySearcher.new(@dictionary)
		search_request.search
	end
end


d = DictionaryUI.new
d.run

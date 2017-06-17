require_relative 'dictionary.rb'
require_relative 'dictionarysearcher.rb'


class DictionaryUI      # user interaction loop
	attr_accessor :dictionary

	def initialize 
		@dictionary = []
	end 

	def run
		puts "Welcome! Search your dictionary for anything you'd like.. "
		set_up_dictionary
		# dict_status
		search_for_something
	end 

	def set_up_dictionary 
		@dictionary = Dictionary.new.get_word_array
	end

	def dict_status 
		puts @dictionary 
	end 

	def search_for_something 
		# puts "Beginning new search "
		search_request = DictionarySearcher.new(@dictionary)
		search_request.search

	end

end


d = DictionaryUI.new
d.run

require_relative 'dictionaryloader.rb'


class Dictionary     # wraps the loaded dictionary 
	def initialize 
		@my_dictionary = Array.new
	end 


	def get_word_array
		process_input = DictionaryLoader.new
		@my_dictionary = process_input.load_dictionary
		# print @my_dictionary
	end 

	def my_dictionary
		@my_dictionary
	end 

	def print_my_dictionary
		print @my_dictionary
	end 
end 



s = Dictionary.new
s.get_word_array
s.print_my_dictionary
# s.my_dictionary


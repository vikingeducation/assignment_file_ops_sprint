require_relative 'dictionary.rb'


class DictionaryUI      # user interaction loop
	def initialize 
		@dictionary = Dictionary.new
	end 

	def run
		puts "Welcome! Search your dictionary for anything you'd like.. "
		set_up_dictionary
	end 

	def set_up_dictionary 
		@dictionary.get_word_array
		# @dictionary.print_my_dictionary
	end
end 


# 	def search_for_things
# 		path = ask_for_file_path
# 		print path 
# 	end 

# 	def ask_for_file_path
# 		print "Where is your dictionary?   "      
# 		file_path = gets.to_s
# 	end 
# end 


# s = DictionaryUI.new
# s.search



#doesn't care where the dictionary actually comes from  - just class the DictionaryLoader class 
#delegate the analysis logic and processes to DictionarySearcher 



# class ResultsSaver    
			# takes a batch of results
			# writes them to a file 
			# initialize 
			# ask_which_file_to_save_to
			# check_if_file_exists
			# overwrite?
			# write to file 
# end 

d = DictionaryUI.new
d.run

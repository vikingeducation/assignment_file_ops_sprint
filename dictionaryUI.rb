require_relative 'dictionary.rb'


class DictionaryUI      # user interaction loop
	def initialize 
		@dictionary = Dictionary.new
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

#first prompt is for the location of your dictionary file. 
# end







# class DictionarySearcher # contains logic & methds to perform searches 
			 # Takes a dictionary
				# initialize 
				# identify_search_type 
			# Exact, Partial, "begins with", "ends with"
				# ask_for_search_term 
				# find_all_matches 
				# display_results 
					# show the number of matches 
					# show the matches - full word 
				# want_to_save
# end 

# class ResultsSaver    
			# takes a batch of results
			# writes them to a file 
			# initialize 
			# ask_which_file_to_save_to
			# check_if_file_exists
			# overwrite?
			# write to file 
# end 

# d = DictionaryUI.new
# d.run 
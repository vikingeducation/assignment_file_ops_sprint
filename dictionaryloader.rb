
class DictionaryLoader     # helper class responsible only for loading in the dictionary
	def initialize (file_path = nil, word_array = [ ])
		@file_path = file_path 
		@word_array = word_array 
	end


	def load_dictionary
		ask_for_file_path
		word_array
	end 


	private
	def ask_for_file_path
		print "Where is your dictionary?  " 
		@file_path = gets.strip.to_s
		validate_file_exist
	end

	
	def validate_file_exist
		if File.exists?("#{@file_path}") == false
			print "No file found. "
			load_dictionary
		else 
			create_dictionary_array
		end 
	end

	
	def create_dictionary_array
		File.readlines("#{@file_path}").each do |word|
			@word_array << word.to_s.chomp
		end
	end 


	#return the results to the dictionary
	def word_array		
		 @word_array
	end
end 

require 'json'

class ResultsSaver    
	attr_accessor :results

	def intialize
		@results = []
		# @file_name = file_name
	end 

	def save_results_array (results_passed_in)
		@results = results_passed_in
		write 
	end 

	def write
		print_results
		get_file_name 
		# write_to_file 
	end 

	def print_results 
		print @results
	end 


	def get_file_name 
		print "Which file would like to save your results to?  "
		requested_file = gets.to_s.strip
		check_for_existing_file(requested_file)
	end 

	def check_for_existing_file (requested_file)
		if	File.exist?(requested_file) == true 
			overwrite?(requested_file)
		else
			puts "will create and write file "
				save_results_to_file(requested_file, "w") 
		end 
	end 

	def overwrite?(requested_file)
		print "File already exists. Would you like to overwrite the file? (y/n)  "
		overwrite_decision = gets.strip
		if overwrite_decision == "y"
			puts "will overwrite existing file "
				save_results_to_file(requested_file, "w")
		else
			print "Your results will be saved to the end of the file. "
			save_results_to_file(requested_file, "a")
		end 
	end

	def save_results_to_file(requested_file, open_mode)
		File.open(requested_file, open_mode) do |file|
			file.write @results.to_json
		end 
	end 

end 

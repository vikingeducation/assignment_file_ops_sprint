require 'json'

class ResultsSaver    
	attr_accessor :results, :file_name

	def intialize
		@results = []
		@file_name = " "
	end 

	def save_results_array (results_passed_in)
		@results = results_passed_in
		get_file_name 
	end 



private 
	def get_file_name 
		print "Which file would like to save your results to?  "
		@file_name = gets.to_s.strip
		check_for_existing_file
	end 


	def check_for_existing_file
		if	File.exist?(@file_name) == true 
			overwrite?
		else
			puts "File has been created and results have been saved. "
				save_results_to_file("w") 
		end 
	end 


	def overwrite?
		print "File already exists. Would you like to overwrite the file? (y/n)  "
		overwrite_decision = gets.strip
		if overwrite_decision == "y"
			puts "File will be overwritten."
				save_results_to_file("w")
		else
			print "Your results will be saved to the end of the file. "
			save_results_to_file("a")
		end 
	end


	def save_results_to_file(open_mode)
		File.open(@file_name, open_mode) do |file|
			file.write @results.to_json
		end 
	end 
end 

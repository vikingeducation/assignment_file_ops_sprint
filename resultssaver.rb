class ResultsSaver    
	attr_accessor :file_name

	def intialize (results)
		@results = results 
		# @file_name = file_name
	end 

	def write 
		get_file_name 
		# write_to_file 
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
			# create+write
		end 
	end 

	def overwrite?(requested_file)
		print "File already exists. Would you like to overwrite the file? (y/n)  "
		overwrite_decision = gets.strip
		if overwrite_decision == "y"
			puts "will overwrite existing file "
				# overwrite to requested file 
		else
			print "Is there another file you'd like to save your results to? (y/n)"
			change_file_decision = gets.strip
			if change_file_decision == "y"
				get_file_name
			end 
		end 
	end

	# def create_file (requested_file)
	# def save_to_file(requested_file)
			# write to file 
end 

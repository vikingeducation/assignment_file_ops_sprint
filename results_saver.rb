class ResultsSaver
	def initialize(search_results)
		@search_results = search_results
	end

	def how_save
		puts "What file path should we write results to?"
		save_location = gets.chomp
		 if File.exist?(save_location)
			 puts "That file exists, overwrite? y/n? 'q' quits."
			 overwrite = gets.chomp.downcase
			 if overwrite == "y"
				 save(save_location, "w")
			 else
				 save(save_location, "a")
			 end
		 else
			 save(save_location, "w")
		 end
		 puts "File saved, thaks for using this program"
	end

	def save(location, mode)
		File.open("#{location}", "#{mode}") do |file|
			file.write "#{@search_results}"
		end
	end
end

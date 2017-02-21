class ResultsSaver
	def self.save_results(file_name, array)
		File.open(file_name, "w") do |file|
			file.write array
		end
	end
end




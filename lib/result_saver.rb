

class ResultSaver

	def self.check_file_exist(a_path)
		File.file?(a_path)
	end

	def self.save_results(a_path, results)
		file = File.open(a_path, "w")
		results.each do |item|
			file.write item
			file.write "\n"
		end
	end

end
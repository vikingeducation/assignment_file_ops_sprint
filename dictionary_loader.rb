# This class provides the methods to load a specified dictionary

class DictionaryLoader

	def load(dictionary_name)
		arr = []
		file = File.open(dictionary_name, "r") do |file|
			arr = file.readlines
			arr = arr.map {|word| word.strip }
		end
		arr
	end
end
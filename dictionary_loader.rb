class DictionaryLoader
	require './dictionary'
	def self.load(file_location)
		word_list = File.readlines("#{file_location}")
		if word_list.length > 0
			puts "Dictionary was successfully loaded."
		end
		return Dictionary.new(word_list)
	end

end

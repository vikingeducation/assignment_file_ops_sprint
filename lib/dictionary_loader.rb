require_relative "dictionary.rb"

class DictionaryLoader

	def self.generate_a_dictionary_from_file(path_to_file)
		dictionary = Dictionary.new
		File.open(path_to_file, 'r') do |f1|  
  			while line = f1.gets  
    			dictionary.words << line.chomp
  			end  
		end
		dictionary
	end

end



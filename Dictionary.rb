
class Dictionary
	attr_reader :my_dictionary, :clean_dictionary
	def initialize
		@my_dictionary = ""
		@clean_dictionary = []
	end

	def get_dict
		@my_dictionary = File.readlines("2of12.txt")
	end

	def clean
		@my_dictionary.each {|word| @clean_dictionary << word.strip}
	end
end




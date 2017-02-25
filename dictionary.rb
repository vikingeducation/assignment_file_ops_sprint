#file = File.readlines("5desk.txt")
#arr = []
#puts file

#file.each do |line|
#	arr << line.split
#end

#puts arr.length


require 'pry'
class DictionaryUI
	attr_accessor :file

	def initialize
		@file = file
	end

	def get_file
		puts "What file would you like open: "
		@file = gets.chomp.to_s
	end

	def get_word
		puts "What word would you like to find"
		@word = gets.chomp.to_s
	end
end

 
class DictionaryLoader
	attr_accessor :file, :dictionary

	def initialize 
		@file = file
		@dictionary = dictionary
		@c = DictionaryUI.new
	end

	def load_file
		@@dictionary = File.readlines(@c.get_file)
		 @@dictionary
	end
	def print_file
		puts @@dictionary
		

	end


end

class DictionarySearcher < DictionaryLoader
	attr_accessor :match_word
	@a = DictionaryLoader.new

		def initialize
			@dictionary = dictionary
			@match_word = match_word
			@d = DictionaryUI.new
		end

		def get_matches
			@match_word = @d.get_word
			puts print_file
		
		end

end



b = DictionaryLoader.new
b.load_file
search = DictionarySearcher.new
search.get_matches
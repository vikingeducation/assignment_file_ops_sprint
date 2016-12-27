

class Dictionary

	attr_accessor :words, :word_count

	def initialize
		@words = []
		@word_count = 0
	end

	def word_count
		@words.count
	end

	def frequencies(first_char)
		count = 0
		words.each do |item|
			count += 1 if item[0] == first_char
		end
		count
	end

	def all_frequencies
		a_to_z = ('a'..'z').to_a
		char_frequencies = {}
		a_to_z.each do |a_char|
			char_frequencies[a_char] = frequencies(a_char)
		end
		char_frequencies
	end

end
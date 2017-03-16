class Dictionary
	attr_reader :word_list
	def initialize(word_list)
		@word_list = word_list
	end

	def word_count
		count = @word_list.length
		puts "Your dictionary contains #{count} words."
	end

	def frequency
		puts "Word frequency by starting letter:"
		letter_count = Array.new(26, 0)
		@word_list.each do |word|
			first_letter_ascii = word.downcase[0].ord
			letter_count[first_letter_ascii - 97] += 1
		end
		letter_count.each_with_index do |count, index|
			cap_letter = (index + 65).chr
			puts "#{cap_letter}: #{count}"
		end
	end
end

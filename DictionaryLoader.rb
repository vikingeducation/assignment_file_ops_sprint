
class DictionaryLoader

	def word_count(words_list)		
		puts "Your dictionary was succesfully loaded!"
		puts "Your dictionary contains #{words_list.count} words." 
		puts "Word frequency by starting letter:"

		("a".."z").to_a.each do |letter|
			word_match = words_list.select { |word| word[0] == letter }
			word_count = word_match.length
			puts "#{letter.upcase}: #{word_count}"
		end
		nil
	end

end

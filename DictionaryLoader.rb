
class DictionaryLoader
	def word_count(words_list)
		puts "Your dictionary was succesfully loaded!"
		puts "Your dictionary contains #{words_list.count} words." 
		puts "Word frequency by starting letter:"
		("a".."z").to_a.each do |letter|
			count = 0
			words_list.each do |word|
				if word[0] == letter
					count += 1
				end
				count
			end
			puts "#{letter.upcase}: #{count}"
		end
		nil
	end	
end



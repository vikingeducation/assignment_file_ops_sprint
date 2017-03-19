class DictionarySearcher
	attr_reader :results
	def initialize 
		@results = nil
	end

	def display_matches(array)
		puts "Found #{array.size} matches:"
		array.each { |word| puts word }
		array.size
	end

	def exact(words_list, term)
		word_match = words_list.select { |word| word == term }
		display_matches(word_match)
		@results = word_match
	end

	def partial(words_list, term)
		word_match = words_list.select { |word| word.include?(term) }
		display_matches(word_match)
		@results = word_match
	end

	def begins_with(words_list, term)
		word_match = words_list.select { |word| (/\A#{term}/ =~ word) != nil }
		display_matches(word_match)
		@results = word_match
	end

	def ends_with(words_list, term)
		word_match = words_list.select { |word| (/#{term}\z/ =~ word) != nil }
		display_matches(word_match)
		@results = word_match
	end
end
 






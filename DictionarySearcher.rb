class DictionarySearcher
	attr_reader :results
	def initialize 
		@results = nil
	end

	def display_matches(array)
		puts "Found #{array.size} matches:"
		array.each {|word| puts word}
		array.size
	end

	def exact(words_list, term)
		arr = []
		words_list.each do |word|
			arr << word if word == term 
		end
		display_matches(arr)
		@results = arr
	end

	def partial(words_list, term)
		arr = []
		words_list.each do |word|
			arr << word if word.include? (term)
		end
		display_matches(arr)
		@results = arr
	end

	def begins_with(words_list, term)
		arr = []
		words_list.each do |word|
			arr << word unless (/\A#{term}/ =~ word) == nil 
		end
		display_matches(arr)
		@results = arr
	end

	def ends_with(words_list, term)
		arr = []
		words_list.each do |word|
			arr << word unless (/#{term}\z/ =~ word) == nil
		end
		display_matches(arr)
		@results = arr
	end
end






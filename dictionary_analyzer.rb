# This Class provides the methods to search through and/or
# analyze a provided dictionary.

class DictionaryAnalyzer

	# Get the total number of words in dictionary
	def word_count(dictionary)
		dictionary.length
	end

	# Get the total number of words starting with a 
	# particular letter.
	def word_count_by_letter(letter, dictionary)
		words_by_letter = []
		regex = /^#{letter}.../
		dictionary.each do |word|
			unless word.match(regex) == nil
				words_by_letter << word
			end
		end
		words_by_letter.count
	end

	# Perform a search on the dictionary.
	# 1- Exact, 2- Partial, 3- Begins w/, 4- Ends w/
	def search(type, dictionary)
		system "clear"
		puts "Enter the string you'd like to search for:"
		print ">".blink.cyan
		input = gets.chomp
		if type == 1
			results = search_exact(input, dictionary)
		elsif type == 2
			results = search_partial(input, dictionary)
		elsif type == 3
			results = search_begins_with(input, dictionary)
		elsif type == 4
			results = search_ends_with(input, dictionary)
		end
		# TODO: Run through file save functions
		results
	end

	# Exact match search
	def search_exact(query, dictionary)
		result = []
		regex = /^#{query}$/
		dictionary.each do |word|
			unless word.match(regex) == nil
				result << word
			end
		end
		result
	end

	# Partial match search
	def search_partial(query, dictionary)
		result = []
		regex = /^.*#{query}.*$/
		dictionary.each do |word|
			unless word.match(regex) == nil
				result << word
			end
		end
		result
	end

	# Begins with search
	def search_begins_with(query, dictionary)
		result = []
		regex = /^#{query}.*/
		dictionary.each do |word|
			unless word.match(regex) == nil
				result << word
			end
		end
		result
	end

	# Ends with search
	def search_ends_with(query, dictionary)
		result = []
		regex = /.*#{query}$/
		dictionary.each do |word|
			unless word.match(regex) == nil
				result << word
			end
		end
		result
	end
end
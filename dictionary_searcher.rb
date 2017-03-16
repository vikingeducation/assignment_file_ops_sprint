class DictionarySearcher
	def initialize(dictionary)
		@dictionary = dictionary
	end

	def ask_search
		puts "What kind of search?"
		puts "1: Exact"
		puts "2: Parial"
		puts "3: Begins With"
		puts "4: Ends With"
	 search_type = gets.chomp.to_i
	 return search_type
	end

	def ask_term
		puts "Enter search term"
		search_term = gets.strip
		return search_term
	end

	def search(search_type, search_term)
		case search_type
		when 1
			exact(search_term)
		when 2
			partial(search_term)
		when 3
			begins(search_term)
		when 4
		ends(search_term)
		else
			puts "Please enter a number between 1 and 4"
			search_type = gets.chomp.to_i
			self.search(search_type, search_term)
		end
	end

	def exact(term)
		regex = /\s#{term}\s/
		string = @dictionary.word_list.join("")
		results = string.scan(regex)
		print_results(results)
	end

	def partial(term)
		regex = /#{term}/
		results = []
		@dictionary.word_list.each  do |word|
			if regex.match(word)
				results << (word)
			end
		end
		print_results(results)
	end

	def begins(term)
		regex = /\A#{term}/
		results = []
		@dictionary.word_list.each  do |word|
			if regex.match(word)
				results << (word)
			end
		end
		print_results(results)
	end

	def ends(term)
		regex = /#{term}\s/
		results = []
		@dictionary.word_list.each  do |word|
			if regex.match(word)
				results << (word)
			end
		end
		print_results(results)
	end

	def print_results(results)
		count = results.length
		puts "Number of matches: #{count}"
		results.each do |result|
			puts result.strip
		end
	end

end

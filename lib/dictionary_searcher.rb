
class DictionarySearcher

	def self.exact_match(dictionary, exp_to_match)
		matches = []
		regex = /#{Regexp.quote(exp_to_match)}/
		dictionary.words.each do |word|
			if word.match(regex) && word.size == exp_to_match.size
				matches << word
			end
		end
		matches
	end

	def self.partial_match(dictionary, exp_to_match)
		matches = []
		regex = /#{Regexp.quote(exp_to_match)}/
		dictionary.words.each do |word|
			if word.match(regex)
				matches << word
			end
		end
		matches
	end

	def self.begin_with_match(dictionary, exp_to_match)
		matches = []
		regex = /\A#{Regexp.quote(exp_to_match)}/
		dictionary.words.each do |word|
			if word.match(regex)
				matches << word
			end
		end
		matches
	end

	def self.end_with_match(dictionary, exp_to_match)
		matches = []
		regex = /#{Regexp.quote(exp_to_match)}\z/
		dictionary.words.each do |word|
			if word.match(regex)
				matches << word
			end
		end
		matches
	end

end
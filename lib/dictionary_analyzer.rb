class DictionaryAnalyzer
	attr_accessor :dictionary

	def initialize(options={})
		@dictionary = options[:dictionary]
	end

	def matches(pattern)
		@dictionary.select do |word|
			word =~ pattern
		end
	end

	def exactly_matches(str)
		matches(/^#{str}$/)
	end

	def partially_matches(str)
		matches(/#{str}/)
	end

	def begins_with(str)
		matches(/^#{str}/)
	end

	def ends_with(str)
		matches(/#{str}$/)
	end
end
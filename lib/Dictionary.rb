require 'pry'


class Dictionary

	attr_reader :dictionary

	def initialize( dictionary = nil )

		@dictionary = dictionary

	end

	def close

		@dictionary.close

	end

end
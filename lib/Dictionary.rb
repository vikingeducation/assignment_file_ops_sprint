class Dictionary

	attr_accessor :file, :dictionary

	def initialize( file = nil )

		@dictionary = file

	end

	def close

		@dictionary.close

	end


end
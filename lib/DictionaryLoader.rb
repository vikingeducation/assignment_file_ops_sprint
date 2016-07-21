# Create a class DictionaryLoader whose purpose is to perform the loading and processing of the specified dictionary file before returning it as an instance of a Dictionary. Remember that classes don't need to be big!

# # Return statistics about your dictionary when it is first loaded, including word count and words by starting letter:

require 'pry'
require_relative 'Dictionary'

class DictionaryLoader

	attr_reader :arr

	def initialize

		@file = nil
		@file_path = nil

	end


	def load

		return @file = File.open( @file_path, 'r' )

	end


	def close

		@file.close

	end



	def valid_file_path?( file_path )
		@file_path = file_path
		File.file?( @file_path ) ? true : false

	end









end #/.DictionaryLoader
# Create a class DictionaryLoader whose purpose is to perform the loading and processing of the specified dictionary file before returning it as an instance of a Dictionary. Remember that classes don't need to be big!

# # Return statistics about your dictionary when it is first loaded, including word count and words by starting letter:

require 'pry'


class DictionaryLoader

	attr_reader :arr, :file, :word_hash

	def initialize

		@file = nil
		@file_path = nil
		@word_hash = Hash.new { |h, k| h[k] = Array.new }
		@arr = []

	end


	def load

		@file = File.open( @file_path, 'r' )
		process_dictionary

	end



	def valid_file_path?( file_path )

		@file_path = file_path
		File.file?( @file_path ) ? true : false

	end

	def process_dictionary

		create_array

		count_starting_letters

	end


	def create_array

		@file.readlines.each do | w |

			@arr << w.strip

		end

	end


	def count_starting_letters

		@arr.each do | w |

			w_upcase = w.upcase
			@word_hash[ w_upcase[0] ] << w

		end

	end


end #/.DictionaryLoader
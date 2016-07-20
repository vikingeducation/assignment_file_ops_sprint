# Create a class DictionaryLoader whose purpose is to perform the loading and processing of the specified dictionary file before returning it as an instance of a Dictionary. Remember that classes don't need to be big!

# # Return statistics about your dictionary when it is first loaded, including word count and words by starting letter:

require 'pry'
require_relative 'Dictionary'

class DictionaryLoader

	attr_reader :arr

	def initialize

		@file = nil
		@file_path = nil
		@word_hash = Hash.new { |h, k| h[k] = Array.new }
		@arr = []

	end


	def load

		@file = File.open( @file_path, 'r' )
		create_array

		print_word_count
		print_starting_letters


	end




	def create_dictionary

		Dictionary.new( @file )

	end




	def valid_file_path?( file_path )
		@file_path = file_path
		File.file?( @file_path ) ? true : false

	end




	def create_array

		@file.readlines.each do | w |

			@arr << w.strip

		end

	end



	def count_words

		return @arr.count

	end


	def count_starting_letters

		@arr.each do | w |

			w_upcase = w.upcase
			@word_hash[ w_upcase[0] ] << w

		end

		return @word_hash

	end

	def print_word_count

		puts "The dictionary has #{count_words} words."

	end




	def print_starting_letters

		@word_hash = count_starting_letters

		puts "Count of words starting with each letter:"

		@word_hash.each do | k, v |

			puts "#{k}: #{v.count}"

		end


	end

end #/.DictionaryLoader
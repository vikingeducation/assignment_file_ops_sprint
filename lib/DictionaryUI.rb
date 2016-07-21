# Create a DictionaryUI class to handle the user interaction loop. The first prompt is for the location of your dictionary file.

# DictionaryUI
	# @file_name
	# initializes :
		# DictionaryLoader
		# DictionarySearcher
		# DictionarySaver
	# prompts the user for the file
	# prompts the user for saving the file
	# asks the user overwrite file
	# raises errors if no file is found

	# displays results from DictionarySearches

# DictionaryLoader
	# loads the file
	# creates the Dictionary
	# reads the file
	# determines # words
	# determines # words starting letters

# Dictionary
	# intializes instance of dictionary ( file )


# DictionarySearcher
	# takes instance of Dictionary
	# exact_matches
	# partial_matches
	# begins_with
	# ends with

# DictionarySaver
	# takes the name to save
	# takes in the file to save
	# checks if that file exists
	# takes in the mode to save

require_relative 'DictionaryLoader'
require_relative 'DictionarySearcher'
require_relative 'ResultsSaver'
require_relative 'Dictionary'
require 'pry'


class DictionaryUI

	attr_reader :loader, :searcher, :dictionary

	def initialize

		@loader = DictionaryLoader.new
		@searcher = DictionarySearcher.new
		#@saver = ResultsSaver.new
		@dictionary = Dictionary.new
		@file


		@word_hash = Hash.new { |h, k| h[k] = Array.new }
		@arr = []

	end


	def run

		loop do
			# put into a loop that checks in loader if file exists
			prompt_for_file_location

			break if @loader.valid_file_path?( get_location_of_file )

		end

		puts "Dictionary loaded successfully"

		@file = @loader.load
		@dictionary.dictionary = @file

		process_dictionary

		prompt_search

		search

		display_search_results

		close

	end

	def close

		@dictionary.close

	end


	def display_search_results


	 puts "Found #{@searcher.results.count} matches:"

		@searcher.results.each do | x |

			puts x

		end




	end


	def prompt_search

		ask_for_search
		ask_for_word

	end


	def search

		@searcher.search( @arr )

	end




	def process_dictionary

		create_array
		count_words
		print_word_count
		count_starting_letters
		print_starting_letters

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

		return @word_hash

	end


	def count_words

		return @arr.count

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




	def display_options

		puts "Please enter what type of search"
		puts "1. Exact Match"
		puts "2. Partial Match"
		puts "3. Begins With"
		puts "4. Ends With"

	end


	def ask_for_search

		selection = 0

		until (1..4) === selection

			display_options
			selection = gets.strip.to_i

		end

		@searcher.search_type = selection

	end


	def ask_for_word

		puts "Please enter your word"

		@searcher.word = gets.strip

	end



	def prompt_for_file_location

		puts "Please enter the location of your file."

	end



	def get_location_of_file

		return gets.strip

	end






end #/.DictionaryUI

d = DictionaryUI.new
d.run
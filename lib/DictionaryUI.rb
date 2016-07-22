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
		@saver = ResultsSaver.new
		@dictionary = Dictionary.new

		@save_hash = Hash.new

	end


	def run

		loop do

			prompt_for_file_location

			break if @loader.valid_file_path?( get_location_of_file )

		end

		puts "Dictionary loaded successfully"

		@loader.load

		display_dictionary_stats

		@dictionary.dictionary = @loader.file

		prompt_search

		search

		display_search_results

		prompt_save

		close

	end



	def prompt_for_file_location

		puts "Please enter the location of your file."

	end



	def get_location_of_file

		return gets.strip

	end



	def display_dictionary_stats

		print_word_count

		print_starting_letters

	end


	def print_word_count

		puts "The dictionary has #{@loader.arr.count} words."

	end



	def print_starting_letters

		puts "Count of words starting with each letter:"

		@loader.word_hash.each do | k, v |

			puts "#{k}: #{v.count}"

		end


	end



	def prompt_search

		ask_for_search
		ask_for_word

	end

	def ask_for_search

		selection = 0

		until (1..4) === selection

			display_options
			selection = gets.strip.to_i

		end

		@searcher.search_type = selection

	end


	def display_options

		puts "Please enter what type of search"
		puts "1. Exact Match"
		puts "2. Partial Match"
		puts "3. Begins With"
		puts "4. Ends With"

	end


	def ask_for_word

		puts "Please enter your word"

		@searcher.word = gets.strip

	end



	def search

		@searcher.search( @loader.arr )

	end



	def display_search_results

	 puts "For word: #{@searcher.word}"
	 puts "Found #{@searcher.results.count} matches:"

		@searcher.results.each do | x |

			puts x

		end

	end


	def prompt_save

		input = ""

		until input == 'Y' || input == 'N'

			puts "Would you like to save your results?"
			puts "Y or N?"

			input = gets.strip.upcase

		end

		save( input )

	end



	def save( input )

		input == 'Y' ? get_file_path : exit
binding.pry
		if input == 'Y'

			generate_save_data
			get_file_path

		else

			exit

		end

	end



	def get_file_path

		puts "Where would you like to save?"

		file_path = gets.strip

		@saver.check_file( file_path ) ? prompt_overwite : @saver.save( @save_hash )

	end


	def generate_save_data

		@save_hash = { 'word' => @searcher.word, 'results' => @loader.word_hash }
binding.pry
	end



	def prompt_overwite

		input = ''

		until input == 'Y' || input == 'N' do

			puts "That file already exists. Overwrite?"
			puts "Y or N"

			input = gets.strip.upcase

		end

		input == 'Y' ? @saver.save( @save_hash ) :	get_file_path


	end



	def close

		@dictionary.close

	end



end #/.DictionaryUI

d = DictionaryUI.new
d.run
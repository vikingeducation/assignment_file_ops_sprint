require_relative("dictionary_loader.rb")
require_relative("dictionary_analyzer.rb")
require('colorize')

class Dictionary
	attr_reader :dictionary

	def initialize
		@dictionary_loader = DictionaryLoader.new
		@dictionary_analyzer = DictionaryAnalyzer.new
		@dictionary = get_dictionary
		# We want to display some of the vital stats when
		# the dictionary is loaded.
		word_count
		("a".."z").each do |letter|
			word_count_by_letter(letter)
		end
	end

	# Loop through and prompt the user to input the dictionary
	# file they'd like to use.
	def get_dictionary
		error_message = nil
		loop do
			system "clear"
			# TODO: Output the available dictionaries
			puts error_message || "Please enter the name of the dictionary file you'd like to use:"
			print ">".blink.cyan
			input = gets.chomp
			begin
				File.open(input, "r")
			rescue
				error_message = "Sorry, that dictionary doesn't exist. Please enter another."
				redo
			else
				return @dictionary_loader.load(input)
				break
			end	
		end
	end

	# Get the total number of words in the dictionary
	def word_count
		puts "There are #{@dictionary_analyzer.word_count(@dictionary)} words in this dictionary."
	end

	# Get the total number of words starting with a particular letter
	def word_count_by_letter(letter)
		puts "#{@dictionary_analyzer.word_count_by_letter(letter, @dictionary)} words begin with the letter #{letter}"
	end

	# Start the search loop
	def search
		error_message = nil
		results = []
		loop do
			# system "clear"
			puts error_message || "Please enter how you'd like to search.".green
			puts "1) Exact Match\n2) Partial Match\n3) Begins With...\n4) Ends With...\n"
			print ">".blink.cyan
			input = gets.chomp.to_i
			if input.is_a?(Fixnum) && input >= 1 && input <= 4
				results = @dictionary_analyzer.search(input, @dictionary)
				break
			else
				error_message = "Sorry, invalid input. Please choose 1,2,3 or 4."
				redo
			end	
		end

		# Now that we have the results let's do something
		# with them. Unless there aren't any.
		if results.count == 0
			puts "Sorry, no words were found that match that string."
		else
			found_match(results)
		end
	end

	# What to do if a search found matches
	def found_match(results)
		error_message = nil
		loop do
			system "clear"
			puts error_message unless error_message.nil?
			puts "There were #{results.count} matches found.".green
			puts "How would you like to proceed?"
			puts "1) Save as file\n2) Output in console"
			print ">".blink.cyan
			input = gets.chomp.to_i
			if input == 1 || input == 2
				if input == 1 
					save_file(results)
					break
				else
					system "clear"
					puts "Matches:".green
					puts results
					break
				end
			else
				error_message = "Invalid input. Please enter 1 or 2."
				redo
			end
		end
		
	end

	def save_file(results)
		loop do
			system "clear"
			puts "Enter file name (include .txt)"
			print ">".blink.cyan
			input = gets.chomp
			if File.file?("results/#{input}")
				# Should we overwrite?
				puts "Filename already exists."
				puts "Would you like to overwrite? Enter y or n".red
				overwrite = gets.chomp
				if overwrite == "y"
					File.open("results/#{input}", "w") do |file|
						results.each do |word|
							file.write "#{word}\n"
						end
					end
					break
				else
					redo
				end
			else
				File.open("results/#{input}", "w") do |file|
					results.each do |word|
						file.write "#{word}\n"
					end
				end
				break
			end
		end
		puts "File saved in results directory".green
	end
end

d = Dictionary.new
d.search
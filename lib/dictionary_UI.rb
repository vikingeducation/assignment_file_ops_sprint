require 'colorize'
require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'result_saver'

class DictionaryUI

	def open_file
		puts "Where is your dictionary? ('q' to quit)".blue
		file_path = gets.chomp
		loop do
			if file_path == 'q'
				puts "User wants to quit! Quitting ...".red
				file_path = nil
				return
			end
			break if File.file? file_path
			puts "File does not exist, please reenter".blue
			file_path = gets.chomp
		end
		file_path
	end

	def print_statistics(dictionary)
		puts "Your dictionary contains " + "#{dictionary.word_count}".blue + " words\n\n"
		frequencies_by_start_char = dictionary.all_frequencies
		puts "Word frequency by starting letter:"
		frequencies_by_start_char.each do |key, value|
			puts key.upcase.to_s + " : " + value.to_s
		end
	end

	def get_command
		user_input = ""
		loop do
			puts "What kind of search?"
			puts "1: Exact"
			puts "2: Partial"
			puts "3: Begins With"
			puts "4: Ends With"
			user_input = gets.chomp
			break if (user_input.to_i > 0 && user_input.to_i < 5) || (user_input == 'q')
		end
		user_input
	end

	def perform_operation(command, dictionary, search_term)
		case command
		when 1 
			results = DictionarySearcher.exact_match(dictionary, search_term)
		when 2 
			results = DictionarySearcher.partial_match(dictionary, search_term)
		when 3 
			results = DictionarySearcher.begin_with_match(dictionary, search_term)
		when 4 
			results = DictionarySearcher.end_with_match(dictionary, search_term)
		else
			return
		end
		results
	end

	def perform_search_and_show_result(user_input, dictionary)
		puts "Enter the search term"
		search_term = gets.chomp
		results = perform_operation(user_input, dictionary, search_term)
		if results
			puts "\nFound #{results.size} match(es):\n\n"
			results.each do |item|
				puts "#{item}".green
			end
		else
			puts "\nFound 0 match(es):\n\n"
		end
		results
	end

	def save_result(results)
		puts "What filepath should we write results to?"
		file_path = gets.chomp
		if ResultSaver.check_file_exist file_path
			puts "That file exists, overwrite? y/n? 'q' quits."
			user_input = gets.chomp
			if user_input == 'q'
				puts "User wants to quit! Quitting ...".red
				return
			end
			if user_input == 'y'
				ResultSaver.save_results(file_path, results)
				return
			end
		else
			ResultSaver.save_results(file_path, results)
		end
	end

	def run
		# ../dictionaries/5desk.txt
		file_path = open_file
		if file_path
			dictionary = DictionaryLoader.generate_a_dictionary_from_file(file_path)
			puts "\nDictionary successfully loaded"
			print_statistics dictionary
			loop do
				user_input = get_command
				if user_input == 'q'
					puts "User wants to quit! Quitting ...".red
					return
				end
				results = perform_search_and_show_result(user_input.to_i, dictionary)
				puts "Do you want to save results? y/n? 'q' quits."
				user_input = gets.chomp
				if user_input == 'q'
					puts "User wants to quit! Quitting ...".red
					return
				end
				if user_input == 'y'
					save_result(results)
				end
			end
		end
	end
end

app = DictionaryUI.new
app.run
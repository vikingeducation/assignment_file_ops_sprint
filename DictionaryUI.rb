require_relative "Dictionary.rb"
require_relative "DictionaryLoader.rb"
require_relative "DictionarySearcher.rb"
require_relative "ResultsSaver.rb"

class DictionaryUI	
	attr_reader :search_type, :search_term, :file_name, :results
	def initialize 
		@user_dictionary = Dictionary.new
		@searcher = DictionarySearcher.new
		@loader = DictionaryLoader.new
		@search_type = nil
		@search_term = nil
		@file_name = nil
		@results = []
	end

	def run
		puts "Where is your dictionary?"
		dict_loc = gets.chomp
		until dict_loc == "2of12.txt"
			puts "Dictionary not found!  Please specifiy another file!"
			dict_loc = gets.chomp
		end
		@user_dictionary.get_dict
		@user_dictionary.clean
		@loader.word_count(@user_dictionary.clean_dictionary)
	end

	def ask_search
		puts "What kind of search would you like to perform? Enter 'q' to quit"
		puts "1: Exact"
		puts "2: Partial"
		puts "3: Begins With"
		puts "4: Ends With"
		@search_type = gets.chomp
		exit if @search_type == "q"
		until @search_type >= "1" && @search_type <= "4"
			puts "Invalid choice.  Please enter a search type between 1 and 4:"
			@search_type = gets.chomp
			exit if @search_type == "q"
		end
		puts "Enter your search term:"
		@search_term = gets.chomp
		search_results
		if save_results?
			name_of_file
			ResultsSaver.save_results(@file_name, @results) if overwrite?
		end
		search_again? ? ask_search : exit
	end

	def search_results
		if @search_type == "1"
			@searcher.exact(@user_dictionary.clean_dictionary, @search_term)
			@results = @searcher.results
		elsif @search_type == "2"
			@searcher.partial(@user_dictionary.clean_dictionary, @search_term)
			@results = @searcher.results
		elsif @search_type == "3"
			@searcher.begins_with(@user_dictionary.clean_dictionary, @search_term)
			@results = @searcher.results
		else
			@searcher.ends_with(@user_dictionary.clean_dictionary, @search_term)
			@results = @searcher.results
		end
	end

	def search_again?
		puts "Do you want to continue searching? y or n"
		reply = gets.chomp
		until reply == "y" || reply == "n"
			puts "Please reply with y or n."
			reply = gets.chomp
		end
		reply == "y"
	end

	def save_results?
		puts "Do you want to save your results to a file? y or n"
		reply = gets.chomp
		until reply == "y" || reply == "n"
			puts "Please reply with y or n."
			reply = gets.chomp
		end
		reply == "y"
	end

	def name_of_file
		puts "please specify filename"
		@file_name = gets.chomp
	end

	def overwrite?
		if File.exist? (@file_name)
			puts "File exists.  Do you want to overwrite? y or n"
			reply = gets.chomp
		end
		reply == "y" || !(File.exist? (@file_name))
	end

end

d = DictionaryUI.new
d.run
d.ask_search





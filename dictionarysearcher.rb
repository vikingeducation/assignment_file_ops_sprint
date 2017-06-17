require_relative 'resultssaver.rb'

class DictionarySearcher            # contains search analysis logic & methds for searches
	attr_accessor :dictionary, :search_type, :search_phrase 
	@@search_types = {"1" => "Exact", "2" => "Partial", "3" => "Begins With", "4" => "Ends With"}
	
	def initialize (dictionary, search_type = "1", search_phrase = "a")
		@dictionary = dictionary 
		@search_type = search_type
		@search_phrase = search_phrase
	end 

	def search
		display_search_type_options
		ask_for_search_term
		find_all_matches
	end 

	def display_search_type_options
		puts "We have four search type options:  "
		@@search_types.each do |number, name|
	 		puts "   #{number}: #{name}"
 		end 
	 	select_search_type
	end

	def select_search_type   
		print "\nPlease enter a number to choose a search type:  "
		type_selection = gets.to_s.strip
		validate_selection_format(type_selection)
	end 

	def validate_selection_format(type_selection)
		# if @@search_types.keys.include?(type_selection) == false
		if !@@search_types.keys.include?(type_selection)
			print "Invalid selection. "
			select_search_type
		else 
			puts "\nYou have selected a #{@@search_types[type_selection]} search.\n "
			@search_type = type_selection
		end
	end 

	def ask_for_search_term     
		print "Please enter the search term (Dictionary's are case-sensitive): "
		# search_term = gets.to_s.strip
		# @search_phrase = search_term
		@search_phrase = gets.to_s.strip
	end 

	def find_all_matches 
		if @search_type == "1"
			exact_search
		elsif @search_type == "2"
			partial_search 
		elsif @search_type == "3"
			begins_with_search 
		else 
			ends_with_search 
		end 
	end 

	def exact_search 
		if @dictionary.include?(@search_phrase)
			display_results([@search_phrase])
		else
			display_results([])
		end
	end

	def partial_search 
		match_results = []
		@dictionary.each do |entry|
			if entry.include?(@search_phrase) == true 
				match_results << entry 
			end 
		end 
		display_results(match_results)
	end

	def begins_with_search 
		match_results = []
		@dictionary.each do |entry|
			if entry.start_with?(@search_phrase)
				match_results << entry 
			end
		end 
		display_results(match_results)
	end 

	def ends_with_search 
		match_results = []
		@dictionary.each do |entry|
			if entry.end_with?(@search_phrase)
				match_results << entry 
			end
		end 
		display_results(match_results)
	end 

	def display_results (results_array)
		puts "\n Search Results: "
		puts "  Number of results returned: #{results_array.length} "
		print "  The following words match your search: #{results_array}\n\n"
		want_to_save(results_array)
	end

	def want_to_save(results_array)
		print  "Would you like to save your search results? (y/n)  "
		save_response = gets.strip
		if save_response == "y"
			save_results = ResultsSaver.new 
			save_results.write 
		end 
	end 
end 


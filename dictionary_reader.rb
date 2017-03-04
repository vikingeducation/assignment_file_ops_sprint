require 'pry'
#wrapper class
class Dictionary
	attr_accessor :file
	#instatiates dictionary
	def initialize
		@dictionary_loader = DictionaryLoader.new
		@dictionary_ui = DictionaryUI.new
		@dictionary_searcher = DictionarySearcher.new
	end
	#runs dictionary reader
	def run
		#calls get file method and returns into file variable
	  file = 	@dictionary_ui.get_file
	  #calls method to load file and passes in get_file return method
		@dictionary_loader.load_file(file)
		#calls stats method
		@dictionary_loader.stats

		@dictionary_searcher.search_dictionary

	end
end
#class for loading and stats
class DictionaryLoader
	attr_accessor :dictionary, :file
	def initialize
	
  end

	def load_file(file)
		#gets file and puts it into variable
		@@dictionary = File.readlines(file)
		#calls dictionary array method
		dictionary_array
	end
	def dictionary_array
		#initialize empty array
		@@dictionary_array = []
		#iterates through dictionary
		@@dictionary.each do |word|
			#gets word from dictionary and downcase letters & pushes into array
      @@dictionary_array << word.strip.downcase
		end
		
	end

	def stats
		#creates empty hash
		@frequency = Hash.new(0)
		#iterates through dictionary
		@@dictionary_array.each do |word|
			#finds occurence of first letter of word
			@frequency[word[0]] += 1
		end
		#prints total length of dictionary array
		puts "There are #{@@dictionary_array.length} words in your dictionary."
		#prints frequency of begin letter
		puts "Number of words per letter:\n#{@frequency}"
	end
end
#class for user interaction
class DictionaryUI
	attr_accessor :file, :dictionary
	def initialize
		@file = file
  end
  #method to get user file selection
  def get_file
  	puts "What file would you like opened?"
  	#get user input and calls to string method
  	@file = gets.chomp.to_s
  	#returns file
  	return @file
  end

end

class DictionarySearcher < DictionaryLoader
	attr_accessor :user_input
	def initialize
		@user_input = user_input
  end

	def search_dictionary
	loop do 
	#prints to screen search options
  puts "What kind of search?"
  puts "1: Exact"
  puts "2: Partial"
  puts "3: Begins with"
  puts "4: Ends with"
  puts "q: to exit"
  #puts user input into variable
  @user_input = gets.chomp.to_i

  #switches between methods based on user input
  case @user_input
  when 4
  	ends_with_search
  when 3
  	begins_with_search
  when 2
  	partial_search
  when 1
  	search_exact_word
  when "q"
  	exit

  else
  	"invalid selection"
  end
  #stops loop if user inputs q
	break if @user_input = "q".to_i
  end
end

  def search_exact_word
  	#gets word to search
	  puts "Enter word:"
	  @word = gets.chomp.to_s
	  #puts word into regex
	  @regex = /#{@word}/
	  @@dictionary_array.each do |element|
	  	#exact match method
	  	if element == @word
	  	puts "#{element} found!"
			end
     end
     search_dictionary		
	end

	def partial_search
		#gets word to search
	  puts "Enter word:"
	  @word = gets.chomp.to_s
	  #puts word into regex
	  @regex = /#{@word}/
	  #iterates through array
	  @@dictionary_array.each do |element|
	  	#if any letter is in the element, element gets printed
	  	if element.match(@regex)
			puts "#{element}"
		  end
	  end
	  search_dictionary
	end

	def begins_with_search
		#gets word to search
	  puts "Enter word:"
	  @word = gets.chomp.to_s
	  #puts word into regex
	  @regex = /#{@word}/
	  @@dictionary_array.each do |element|
	  	#begin_with function
	  	if element.start_with?(@word)
	  	puts "#{element}"
	    end
	  end
	  search_dictionary
	end

	def ends_with_search
		#gets word to search
	  puts "Enter word:"
	  @word = gets.chomp.to_s
	  #puts word into regex
	  @regex = /#{@word}/
	  @@dictionary_array.each do |element|
	  	#begin_with function
	  	if element.end_with?(@word)
	  	puts "#{element}"
	    end
	  end
	  search_dictionary
	end


end

@dictionary = Dictionary.new
@dictionary.run
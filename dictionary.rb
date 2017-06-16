require_relative 'dictionaryloader.rb'


class Dictionary              # wraps the loaded dictionary 
	def initialize 
		@my_dictionary = Array.new
	end 


	def get_word_array             # initates the DictionaryLoader functions 
		process_input = DictionaryLoader.new
		@my_dictionary = process_input.load_dictionary
		statistics
	end 

	def my_dictionary       # Provides access to the @my_dictionary instance variable 
		@my_dictionary
	end 

	def print_my_dictionary     # Prints the @my_dictionary instance variable 
		print @my_dictionary
	end 

	def statistics               # Show intial dictionary stats 
		puts "Good News! Your dictionary was successfully loaded! "
		puts " "
		puts "Inital Dictionary Stats "
		puts "  Total Words Found: #{@my_dictionary.count}"
		word_count_by_letter
	end

	def word_count_by_letter
		puts "  Total Words by Letter:  "
		puts "		A: #{@my_dictionary.count{|x| x =~ /^a/i}}"
		puts "		B: #{@my_dictionary.count{|x| x =~ /^b/i}}"
		puts "		C: #{@my_dictionary.count{|x| x =~ /^c/i}}"
		puts "		D: #{@my_dictionary.count{|x| x =~ /^d/i}}"
		puts "		E: #{@my_dictionary.count{|x| x =~ /^e/i}}"
		puts "		F: #{@my_dictionary.count{|x| x =~ /^f/i}}"
		puts "		G: #{@my_dictionary.count{|x| x =~ /^g/i}}"
		puts "		H: #{@my_dictionary.count{|x| x =~ /^h/i}}"
		puts "		I: #{@my_dictionary.count{|x| x =~ /^i/i}}"
		puts "		J: #{@my_dictionary.count{|x| x =~ /^j/i}}"
		puts "		K: #{@my_dictionary.count{|x| x =~ /^k/i}}"
		puts "		L: #{@my_dictionary.count{|x| x =~ /^l/i}}"
		puts "		M: #{@my_dictionary.count{|x| x =~ /^m/i}}"
		puts "		N: #{@my_dictionary.count{|x| x =~ /^n/i}}"
		puts "		O: #{@my_dictionary.count{|x| x =~ /^o/i}}"
		puts "		P: #{@my_dictionary.count{|x| x =~ /^p/i}}"
		puts "		Q: #{@my_dictionary.count{|x| x =~ /^q/i}}"
		puts "		R: #{@my_dictionary.count{|x| x =~ /^r/i}}"
		puts "		S: #{@my_dictionary.count{|x| x =~ /^s/i}}"
		puts "		T: #{@my_dictionary.count{|x| x =~ /^t/i}}"
		puts "		U: #{@my_dictionary.count{|x| x =~ /^u/i}}"
		puts "		V: #{@my_dictionary.count{|x| x =~ /^v/i}}"
		puts "		W: #{@my_dictionary.count{|x| x =~ /^w/i}}"
		puts "		X: #{@my_dictionary.count{|x| x =~ /^x/i}}"
		puts "		Y: #{@my_dictionary.count{|x| x =~ /^y/i}}"
		puts "		Z: #{@my_dictionary.count{|x| x =~ /^z/i}}"
	end 



end 



# s = Dictionary.new
# s.get_word_array
# s.print_my_dictionary


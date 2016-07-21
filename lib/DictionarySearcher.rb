# Create a class DictionarySearcher which takes a dictionary and contains methods that perform searches on it.

# Next, allow the user to perform one of four types of searches:

	# Exact matches
	# Partial matches
	# "begins with" matches
	# "ends with" matches
		# These can be done with Regex or not... you should use whatever you're least comfortable with! The results should return the full word, regardless of match type.

	# Once the search is complete, display the number of matches and those matches:
		# 1 exact: 2 partial 3 begins with 4 ends with
		# enter search termn
			# display number of matches

			#Play with this and verify that searches and saving works properly. What other search types can you come up with?



class DictionarySearcher

	attr_accessor :search_type, :word
	attr_reader :file, :results



	def initialize( file = nil )

		@search_type = nil
		@word = nil
		@file = file
		@results = []


	end


	def search( file )

		case @search_type

		when 1
			exact_match( file )
		when 2
			partial_m( file )
		when 3
			begins_with( file )
		when 4
			ends_with( file )
		end


	end




	def exact_match( arr )

		arr.each do | w |

			if @word.upcase == w.upcase

				@results << w

			end

		end


	end



	def partial_match( file )


	end


	def begins_with



	end



	def ends_with



	end


end
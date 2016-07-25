class DictionarySearcher

	attr_accessor :search_type, :word
	attr_reader :results



	def initialize

		@search_type = nil
		@word = nil
		@results = []

	end


	def search( file )

		@word.upcase!

		case @search_type

		when 1
			exact_match( file )
		when 2
			partial_match( file )
		when 3
			begins_with( file )
		when 4
			ends_with( file )
		end


	end


	def exact_match( arr )

		arr.each do | w |

			if @word == w.upcase

				@results << w

			end

		end


	end



	def partial_match( arr )


		arr.each do | w |

			if /#{@word}/ =~ w.upcase

				@results << w

			end

		end


	end


	def begins_with( arr )


		arr.each do | w |

			if /^#{@word}/ =~ w.upcase

				@results << w

			end

		end

	end



	def ends_with( arr )


		arr.each do | w |

			if /#{word}$/ =~ w.upcase

				@results << w

			end

		end

	end


end
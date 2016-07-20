require 'pry'


class Dictionary

	attr_accessor :file, :dictionary

	def initialize( file )

		$dictionary = File.open( file, 'r' )

	end



end
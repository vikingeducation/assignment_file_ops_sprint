# After displaying results, prompt the user whether to save the results to a file.
# If saving to a file, prompt the user for the name of the file to save results to. If it already exists, ask whether to overwrite it or not. Create a ResultsSaver class which takes a batch of results and writes them to a file.

require 'json'

class ResultsSaver

	def initialize( file_path = nil )

		@file_path = file_path

	end


	def check_file( file_path )

		@file_path = file_path

		File.exist?( file_path ) ? true : false


	end



	def save( save_file )

		File.open( @file_path, "w" ) do | file |

			file.write save_file.to_json

		end



	end




end
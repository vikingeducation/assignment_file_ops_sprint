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
			file.close
		end



	end


	def save_data( word, results)

		return { "word" => word, "results" => results}

	end


end
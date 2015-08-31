class DictionarySaver
	attr_accessor :dictionary, :filename

	def initialize(options={})
		@dictionary = options[:dictionary]
		@filename = options[:filename]
	end

	def save
		result = "File not saved, cannot overwrite dictionary.txt"
		write_file unless @filename == "#{Dictionary::PATH}/dictionary.txt"
	end

	def overwrite?
		File.file?(@filename)
	end

	private
		def write_file
			File.open(@filename, 'w') do |f|
				f.write(@dictionary.join("\n"))
			end
			"Saved: #{@filename}"
		end
end
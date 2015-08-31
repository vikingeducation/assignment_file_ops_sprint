class DictionaryLoader
	attr_accessor :path, :words
	attr_reader :file

	def initialize(options={})
		@words = options[:words]
		@file = options[:file]
		@path = options[:path]
		load("#{@file}")
	end

	def load(file)
		file = abs_path(file)
		success = can_load?(file)
		success = read_file(file) if success
		!!success
	end

	def files
		Dir.entries(@path).select {|i| !['.', '..'].include?(i)}
	end

	def can_load?(file)
		File.file?(file)
	end

	private
		def read_file(file)
			@words = []
			@file = file.split('/').last
			File.open(file, 'r') do |f|
				f.readlines.each do |l|
					@words << l.strip
				end
			end
		end

		def abs_path(file)
			"#{@path}/#{file}"
		end
end
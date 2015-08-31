require_relative 'dictionary_analyzer.rb'
require_relative 'dictionary_loader.rb'
require_relative 'dictionary_saver.rb'
require_relative 'dictionary_validation.rb'

class DictionaryModel < Mousevc::Model
	attr_accessor :analyzer, :loader, :saver
	def initialize(options={})
		super(:validation => DictionaryValidation.new(:model => self))
		@analyzer = options[:analyzer] || DictionaryAnalyzer.new
		@loader = options[:loader] || DictionaryLoader.new(:path => Dictionary::PATH)
		@saver = options[:saver] || DictionarySaver.new
	end

	def matches
		@saver.dictionary
	end

	def save
		@saver.save
	end

	def load(value)
		valid_dictionary = @validation.valid_dictionary?(value)
		if valid_dictionary
			dictionary = @loader.files[value.to_i - 1]
			@loader.load(dictionary)
		end
		valid_dictionary
	end

	def search(value)
		valid_search = @validation.valid_search?(value)
		if valid_search
			@analyzer.dictionary = @loader.words
			search_type = [
				:exactly_matches,
				:partially_matches,
				:begins_with,
				:ends_with
			][value.to_i - 1]
			pattern = value.split(' ').last
			@saver.dictionary = @analyzer.send(search_type, pattern)
		end
		valid_search
	end

	def filename(value)
		allow_overwrite = @validation.allow_overwrite?(value)
		value = allow_overwrite ? value.split(' ').last : value
		valid_filename = @validation.valid_filename?(value)
		@saver.filename = "#{Dictionary::PATH}/#{value}"
		will_overwrite = @validation.overwrite? unless allow_overwrite
		(valid_filename && !will_overwrite)
	end

	def yes_or_no?(value)
		@validation.valid_yes_or_no?(value)
	end

	def yes?(value)
		@validation.yes?(value)
	end

	def no?(value)
		@validation.no?(value)
	end
end
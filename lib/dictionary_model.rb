require_relative 'dictionary_analyzer.rb'
require_relative 'dictionary_loader.rb'
require_relative 'dictionary_saver.rb'
require_relative 'dictionary_validation.rb'

class DictionaryModel < Mousevc::Model
	attr_accessor :loader, :analyzer
	def initialize
		super(:validation => DictionaryValidation.new)
		@loader = DictionaryLoader.new
		@analyzer = DictionaryAnalyzer.new
	end
end
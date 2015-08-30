require 'mousevc'

require_relative 'dictionary_controller.rb'
require_relative 'dictionary_model.rb'

class Dictionary < Mousevc::App
	def initialize
		super(
			:controller => 'DictionaryController',
			:model => 'DictionaryModel',
			:views => "#{File.dirname(__FILE__)}/views",
			:action => :welcome
		)
	end
end
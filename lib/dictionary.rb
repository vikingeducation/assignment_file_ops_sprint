require 'mousevc'

include Mousevc

require_relative 'dictionary_controller.rb'
require_relative 'dictionary_model.rb'

class Dictionary < Mousevc::App
	PATH = "#{File.dirname(__FILE__)}/data"

	def initialize
		super(
			:controller => 'DictionaryController',
			:model => 'DictionaryModel',
			:views => "#{File.dirname(__FILE__)}/views",
			:action => :welcome,
			:looping => true,
			:system_clear => true
		)
	end
end
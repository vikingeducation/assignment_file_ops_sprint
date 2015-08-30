class DictionaryController < Mousevc::Controller
	def welcome
		@view.render('Hello Dictionary!')
	end
end
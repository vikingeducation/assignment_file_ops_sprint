class DictionaryController < Mousevc::Controller
	def welcome
		@view.render('header')
		@view.render('welcome', :files => @model.loader.files)
		@view.render('notice')
		@router.action = :select_dictionary
		Input.prompt
	end

	def search_menu
		@view.render('header')
		@view.render('search_menu')
		@view.render('notice')
		@router.action = :select_search
		Input.prompt
	end

	def search_results
		@view.render('header')
		@view.render('search_results', :num_matches => @model.matches.length)
		@view.render('notice')
		@router.action = :select_save
		Input.prompt
	end

	def display_results
		@view.render('header')
		@view.render('display_results', :results => @model.matches.join("\n"))
		@view.render('notice')
		@router.action = :search_menu
		Input.prompt
	end

	def name_file
		@view.render('header')
		@view.render('name_file')
		@view.render('notice')
		@router.action = :select_filename
		Input.prompt
	end

	def write_file
		@router.action = :search_menu
		Input.notice = @model.save
	end

	def select_dictionary
		@router.action = :search_menu
		unless @model.load(Input.data)
			@router.action = :welcome
			Input.notice = @model.validation.error
		end
	end

	def select_search
		@router.action = :search_results
		unless @model.search(Input.data)
			@router.action = :search_menu
			Input.notice = @model.validation.error
		end
	end

	def select_save
		if @model.yes_or_no?(Input.data)
			@router.action = :name_file if @model.yes?(Input.data)
			@router.action = :display_results if @model.no?(Input.data)
		else
			@router.action = :search_results
			Input.notice = @model.validation.error
		end
	end

	def select_filename
		@router.action = :write_file
		unless @model.filename(Input.data)
			@router.action = :name_file
			Input.notice = @model.validation.error
		end 
	end
end
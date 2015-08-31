require 'spec_helper'

describe DictionaryController do
	let(:model) do
		instance_double('DictionaryModel',
			:validation => instance_double('DictionaryValidation',
				:error => 'Error'
			)
		)
	end
	let(:view){instance_double('Mousevc::View')}
	let(:router){instance_double('Mousevc::Router')}
	let(:controller) do
		DictionaryController.new(
			:model => model,
			:view => view,
			:router => router
		)
	end

	before do
		allow(view).to receive(:render)
		allow(router).to receive(:action=)
		allow(Input).to receive(:data)
		allow(Input).to receive(:prompt)
		allow(Input).to receive(:notice=)
	end

	describe '#initialize' do
		it 'returns an instance of the DictionaryController class' do
			expect(controller).to be_an_instance_of(DictionaryController)
		end
	end

	describe '#welcome' do
		before do
			allow(model).to receive(:loader).and_return(instance_double('DictionaryLoader', :files => []))
		end

		it 'calls view#render header' do
			expect(view).to receive(:render).with('header')
			controller.welcome
		end

		it 'calls view#render notice' do
			expect(view).to receive(:render).with('notice')
			controller.welcome
		end

		it 'calls view#render welcome' do
			expect(view).to receive(:render).with('welcome', :files => [])
			controller.welcome
		end

		it 'prompts the user for a dictionary file' do
			expect(Input).to receive(:prompt)
			controller.welcome
		end

		it 'sets the router action to select_dictionary' do
			expect(router).to receive(:action=).with(:select_dictionary)
			controller.welcome
		end
	end

	describe '#select_dictionary' do
		before do
			allow(model).to receive(:load)
		end

		it 'calls model#load' do
			expect(model).to receive(:load).with(nil)
			controller.select_dictionary
		end

		context 'the file is valid' do
			it 'sets router action to search_menu' do
				expect(router).to receive(:action=).with(:search_menu)
				controller.select_dictionary
			end
		end

		context 'the file is invalid' do
			before do
				allow(model).to receive(:load).and_return(false)
			end

			it 'sets the router action to welcome' do
				expect(router).to receive(:action=).with(:welcome)
				controller.select_dictionary
			end

			it 'calls Input#notice=' do
				expect(Input).to receive(:notice=)
				controller.select_dictionary
			end
		end
	end

	describe '#search_menu' do
		it 'calls view#render header' do
			expect(view).to receive(:render).with('header')
			controller.search_menu
		end

		it 'calls view#render notice' do
			expect(view).to receive(:render).with('notice')
			controller.search_menu
		end

		it 'calls view#render search_menu' do
			expect(view).to receive(:render).with('search_menu')
			controller.search_menu
		end

		it 'prompts the user for a search type' do
			expect(Input).to receive(:prompt)
			controller.search_menu
		end

		it 'sets the router action to select_search' do
			expect(router).to receive(:action=).with(:select_search)
			controller.search_menu
		end
	end

	describe '#select_search' do
		before do
			allow(model).to receive(:search)
		end

		context 'the type is valid' do
			it 'calls model#search' do
				expect(model).to receive(:search).with(nil)
				controller.select_search
			end

			it 'sets the router action to search_results' do
				expect(router).to receive(:action=).with(:search_results)
				controller.select_search
			end
		end

		context 'the type is invalid' do
			before do
				allow(model).to receive(:search).with(nil).and_return(false)
			end

			it 'sets the router action to search_menu' do
				expect(router).to receive(:action=).with(:search_menu)
				controller.select_search
			end

			it 'calls Input#notice=' do
				expect(Input).to receive(:notice=)
				controller.select_search
			end
		end
	end

	describe '#search_results' do
		before do
			allow(model).to receive(:matches).and_return([])
		end

		it 'calls view#render header' do
			expect(view).to receive(:render).with('header')
			controller.search_results
		end

		it 'calls view#render notice' do
			expect(view).to receive(:render).with('notice')
			controller.search_results
		end

		it 'calls view#render search_results' do
			expect(view).to receive(:render).with('search_results', :num_matches => 0)
			controller.search_results
		end

		it 'prompts the user if they want to save the results to a file' do
			expect(Input).to receive(:prompt)
			controller.search_results
		end

		it 'sets the router action to select_save' do
			expect(router).to receive(:action=).with(:select_save)
			controller.search_results
		end
	end

	describe '#select_save' do
		before do
			allow(model).to receive(:yes_or_no?)
			allow(model).to receive(:yes?)
			allow(model).to receive(:no?)
		end

		it 'calls model#yes_or_no?' do
			expect(model).to receive(:yes_or_no?)
			controller.select_save
		end

		context 'the user input was y or yes' do
			it 'sets the router action to name_file' do
				allow(model).to receive(:yes_or_no?).and_return(true)
				allow(model).to receive(:yes?).and_return(true)
				expect(router).to receive(:action=).with(:name_file)
				controller.select_save
			end
		end

		context 'the user input was n or no' do
			it 'sets the router action to display_results' do
				allow(model).to receive(:yes_or_no?).and_return(true)
				allow(model).to receive(:no?).and_return(true)
				expect(router).to receive(:action=).with(:display_results)
				controller.select_save
			end
		end

		context 'the user input was invalid' do
			before do
				allow(model).to receive(:yes_or_no?).and_return(false)
			end

			it 'sets the router action to search_results' do
				expect(router).to receive(:action=).with(:search_results)
				controller.select_save
			end

			it 'calls Input#notice=' do
				expect(Input).to receive(:notice=)
				controller.select_save
			end
		end
	end

	# 
	# 

	describe '#display_results' do
		before do
			allow(model).to receive(:matches).and_return([])
		end

		it 'calls view#render header' do
			expect(view).to receive(:render).with('header')
			controller.display_results
		end

		it 'calls view#render notice' do
			expect(view).to receive(:render).with('notice')
			controller.display_results
		end

		it 'calls view#render display_results' do
			expect(view).to receive(:render).with('display_results', :results => '')
			controller.display_results
		end

		it 'prompts the user to continue' do
			expect(Input).to receive(:prompt)
			controller.display_results
		end

		it 'sets the router action to search_menu' do
			expect(router).to receive(:action=).with(:search_menu)
			controller.display_results
		end
	end

	describe '#name_file' do
		it 'calls view#render header' do
			expect(view).to receive(:render).with('header')
			controller.name_file
		end

		it 'calls view#render notice' do
			expect(view).to receive(:render).with('notice')
			controller.name_file
		end

		it 'calls view#render name_file' do
			expect(view).to receive(:render).with('name_file')
			controller.name_file
		end

		it 'prompts the user for a file name' do
			expect(Input).to receive(:prompt)
			controller.name_file
		end

		it 'sets the router action to select_filename' do
			expect(router).to receive(:action=).with(:select_filename)
			controller.name_file
		end
	end

	describe '#select_filename' do
		before do
			allow(model).to receive(:filename)
		end

		context 'the filename is valid' do
			context 'the filename already exists' do
				before do
					allow(model).to receive(:filename).and_return(false)
				end

				it 'sets the router action to name_file' do
					expect(router).to receive(:action=).with(:name_file)
					controller.select_filename
				end

				it 'sets a message on Input.notice' do
					expect(Input).to receive(:notice=)
					controller.select_filename
				end
			end

			context 'the filename does not exist' do
				it 'sets the router action to write_file' do
					allow(model).to receive(:filename).and_return(true)
					expect(router).to receive(:action=).with(:write_file)
					controller.select_filename
				end
			end
		end

		context 'the filename is invalid' do
			before do
				allow(model).to receive(:filename).and_return(false)
			end

			it 'sets the router action to name_file' do
				expect(router).to receive(:action=).with(:name_file)
				controller.select_filename
			end

			it 'sets a message on Input.notice' do
				expect(Input).to receive(:notice=)
				controller.select_filename
			end
		end
	end

	describe '#write_file' do
		before do
			allow(model).to receive(:save)
		end

		it 'calls model#save' do
			expect(model).to receive(:save)
			controller.write_file
		end

		it 'sets the router action to search_menu' do
			expect(router).to receive(:action=)
			controller.write_file
		end

		it 'sets a message on Input.notice saying if save was successful' do
			expect(Input).to receive(:notice=)
			controller.write_file
		end
	end
end





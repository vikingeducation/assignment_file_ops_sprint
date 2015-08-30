require 'spec_helper'

describe DictionaryController do
	describe '#initialize' do
		it 'returns an instance of the DictionaryController class'
	end

	describe '#welcome' do
		it 'calls view#render welcome'
		it 'prompts the user for a dictionary file'
		it 'sets the router action to select_dictionary'
	end

	describe '#select_dictionary' do
		context 'the file valid' do
			it 'calls load on DictionaryLoader to load the file'
			it 'sets router action to search_menu'
		end

		context 'the file is invalid' do
			it 'sets the router action to welcome'
			it 'sets a message on Input.notice'
		end
	end

	describe '#search_menu' do
		it 'calls view#render search_menu'
		it 'prompts the user for a search type'
	end

	describe '#select_search' do
		context 'the type is valid' do
			it 'calls the selected search type on DictionaryAnalyzer'
			it 'sets the router action to search_results'
		end

		context 'the type is invalid' do
			it 'sets the router action to search_menu'
			it ''
		end
	end

	describe '#search_results' do
		it 'calls view#render search_results'
		it 'asks the user if they want to save the results to a file'
		it 'sets the router action to select_save'
	end

	describe '#select_save' do
		context 'the user input was y or yes' do
			it 'sets the router action to name_file'
		end

		context 'the user input was n or no' do
			it 'sets the router action to search_menu'
		end

		context 'the user input was invalid' do
			it 'sets the router action to search_results'
			it 'sets a message on Input.notice'
		end
	end

	describe '#name_file' do
		it 'calls view#render name_file'
		it 'prompts the user for a file name'
		it 'sets the router action to select filename'
	end

	describe '#select_filename' do
		context 'the filename is valid' do
			context 'the filename already exists' do
				it 'sets the router action to overwrite_file'
			end

			context 'the filename does not exist' do
				it 'sets the router action to write_file'
			end
		end

		context 'the filename is invalid' do
			it 'sets the router action to name_file'
			it 'sets a messate on Input.notice'
		end
	end

	describe '#write_file' do
		it 'calls save on the DictionarySaver'
		it 'sets the router action to search_menu'
		it 'sets a message on Input.notice saying if save was successful'
	end

	describe '#overwrite_file' do
		it 'calls view#render overwrite_file'
		it 'asks the user if they want to overwrite the file'
		it 'sets the router action to select_overwrite'
	end

	describe '#select_overwrite' do
		context 'the user input was y or yes' do
			it 'sets the router action to write_file'
		end

		context 'the user input was n or no' do
			it 'sets the router action to search_menu'
		end

		context 'the user input was invalid' do
			it 'sets the router action to overwrite_file'
			it 'sets a message on Input.notice'
		end
	end
end
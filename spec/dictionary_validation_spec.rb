require 'spec_helper'

describe DictionaryValidation do
	describe '#initialize' do
		it 'returns an instance of the DictionaryValidation class'
	end
	describe '#valid_dictionary?' do
		it 'returns true when the dictionary is a valid dictionary file'
		it 'returns false when the file is an invalid dictionary file'
	end
	describe '#valid_search?' do
		it 'returns true if the search type is valid'
		it 'returns false if the search type is invalid'
	end
	describe '#valid_yes_no?' do
		it 'returns true if the value is y, yes, n, or no'
		it 'returns false if the value is not y, yes, n, or no'
	end
	describe '#valid_filename' do
		it 'returns true if the filename is valid'
		it 'returns false if the filename is invalid'
	end
end
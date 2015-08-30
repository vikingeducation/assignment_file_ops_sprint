require 'spec_helper'

describe DictionarySaver do
	describe '#initialize' do
		it 'returns an instance of the DictionarySaver class'
		it 'accepts a hash of options'
		it 'accepts a dictionary to save'
		it 'accepts a filename under which to save the dictionary'
	end

	describe '#dictionary' do
		it 'is an accessor'
	end

	describe '#filename' do
		it 'is an accessor'
	end

	describe '#save' do
		it 'writes the data from the dictionary array to a file at the path filename'
	end

	describe '#overwrite?' do
		it 'returns true if the save will overwrite a file'
		it 'returns false if the save will create a new file'
	end
end
require 'spec_helper'

describe DictionaryLoader do
	describe '#initialize' do
		it 'returns an instance of the DictionaryLoader class'
		it 'accepts a options hash'
		it 'accepts a file to load in the options hash'
	end
	describe '#words' do
		it 'is an accessor'
		it 'is an array'
		it 'is empty by default'
		it 'is populated with words from the loaded dictionary file'
	end
end
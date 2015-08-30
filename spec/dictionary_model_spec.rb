require 'spec_helper'

describe DictionaryModel do
	describe '#initialize' do
		it 'returns an instance of the DictionaryModel class'
	end

	describe '#analyzer' do
		it 'is an accessor'
		it 'is an instance of the DictionaryAnalyzer class'
	end

	describe '#loader' do
		it 'is an accessor'
		it 'is an instance of the DictionaryLoader class'
	end

	describe '#saver' do
		it 'is an accessor'
		it 'is an instance of the DictionarySaver class'
	end
end
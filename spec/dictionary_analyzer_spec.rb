require 'spec_helper'

describe DictionaryAnalyzer do
	describe '#initialize' do
		it 'returns an instance of the DictionaryAnalyzer class'
		it 'accepts an options hash'
		it 'accepts a dictionary array via options'
	end
	describe '#dictionary' do
		it 'is an accessor'
		it 'is an array'
		it 'is an of only strings'
		it 'is the dictionary array set from #initialize options'
	end
	describe '#match' do
		it 'takes a regex or string as a parameter'
		it 'returns an array of words that match the given parameter'
	end
	describe '#exactly_matches' do
		it 'takes a string as a parameter'
		it 'returns an array of strings that match the parameter exactly'
	end
	describe '#partially_matches' do
		it 'takes a string as a parameter'
		it 'returns an array of words that partially match the parameter'
	end
	describe '#begins_with' do
		it 'takes a string as a parameter'
		it 'returns an array of words that begin with the parameter'
	end
	describe '#ends_with' do
		it 'takes a string as a parameter'
		it 'returns an array of words that end with the parameter'
	end
end
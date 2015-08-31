require 'spec_helper'

describe DictionaryAnalyzer do
	let(:dictionary) do
		[
			'aaa',
			'aaaa',
			'aaaaa',
			'aaaaab',

			'abaci',
			'aback',
			'abacus',
			'Abadan',
			'abaft',
			'abalone',
			'abandon',
			'abandoned',
			'abandonedly',
			'abandonment',
			'abase',
			'abasement',
			'abash',
			'abashed',
			'abashedly',
			'abashment',
			'abate',
			'abatement',
			'abattoir',
			'abbacy',
			'abbe',
			'abbess',
			'abbey',
			'abbot',
			'Abbott',
			'abbreviate',
			'abbreviated',
			'abbreviation',
			'abbreviator'
		]
	end
	let(:analyzer){DictionaryAnalyzer.new(:dictionary => dictionary)}

	describe '#initialize' do
		it 'returns an instance of the DictionaryAnalyzer class' do
			expect(analyzer).to be_an_instance_of(DictionaryAnalyzer)
		end

		it 'accepts an options hash' do
			expect {analyzer}.to_not raise_error
		end

		it 'accepts a dictionary array via options' do
			expect {analyzer}.to_not raise_error
		end
	end

	describe '#dictionary' do
		it 'is an accessor' do
			expect do
				analyzer.dictionary
				analyzer.dictionary = nil
			end.to_not raise_error
		end
	end

	describe '#matches' do
		it 'takes a regex as a parameter' do
			expect {analyzer.matches(/a/)}.to_not raise_error
		end

		it 'returns an array of words from the dictionary that match the regex' do
			words = analyzer.matches(/a/)
			expect(words).to be_kind_of(Array)
			words.each do |word|
				expect(analyzer.dictionary.include?(word)).to eq(true)
			end
		end

		it 'returns an empty array when no matches are found' do
			expect(analyzer.matches(/^qwertyuiopasdfghjklzxcvbnm$/)).to be_empty
		end
	end

	describe '#exactly_matches' do
		it 'takes a string as a parameter' do
			expect {analyzer.exactly_matches('foo')}.to_not raise_error
		end

		it 'returns an array of only strings that match the parameter exactly' do
			matches = analyzer.exactly_matches('aaa')
			expect(matches).to eq(['aaa'])
		end
	end

	describe '#partially_matches' do
		it 'takes a string as a parameter' do
			expect {analyzer.partially_matches('foo')}.to_not raise_error
		end

		it 'returns an array of words that partially match the parameter' do
			matches = analyzer.partially_matches('aaa')
			expect(matches).to eq(['aaa', 'aaaa', 'aaaaa', 'aaaaab'])
		end
	end

	describe '#begins_with' do
		it 'takes a string as a parameter' do
			expect {analyzer.begins_with('foo')}.to_not raise_error
		end

		it 'returns an array of words that begin with the parameter' do
			matches = analyzer.begins_with('abac')
			expect(matches).to eq(['abaci', 'aback', 'abacus'])
		end
	end

	describe '#ends_with' do
		it 'takes a string as a parameter' do
			expect {analyzer.ends_with('foo')}.to_not raise_error
		end

		it 'returns an array of words that end with the parameter' do
			matches = analyzer.ends_with('s')
			expect(matches).to eq(['abacus', 'abbess'])
		end
	end
end
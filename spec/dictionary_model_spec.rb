require 'spec_helper'

describe DictionaryModel do
	let(:model){DictionaryModel.new}

	describe '#initialize' do
		it 'returns an instance of the DictionaryModel class' do
			expect(model).to be_an_instance_of(DictionaryModel)
		end
	end

	describe '#analyzer' do
		it 'is an accessor' do
			expect do
				model.analyzer
				model.analyzer = nil
			end.to_not raise_error
		end

		it 'is an instance of the DictionaryAnalyzer class' do
			expect(model.analyzer).to be_an_instance_of(DictionaryAnalyzer)
		end
	end

	describe '#loader' do
		it 'is an accessor' do
			expect do
				model.loader
				model.loader = nil
			end.to_not raise_error
		end

		it 'is an instance of the DictionaryLoader class' do
			expect(model.loader).to be_an_instance_of(DictionaryLoader)
		end
	end

	describe '#saver' do
		it 'is an accessor' do
			expect do
				model.saver
				model.saver = nil
			end.to_not raise_error
		end

		it 'is an instance of the DictionarySaver class' do
			expect(model.saver).to be_an_instance_of(DictionarySaver)
		end
	end

	describe '#load' do
		before do
			allow(model.validation).to receive(:valid_dictionary?)
			allow(model.loader).to receive(:load)
			allow(model.loader).to receive(:files).and_return(['file.txt'])
		end

		it 'calls validation#valid_dictionary?' do
			expect(model.validation).to receive(:valid_dictionary?)
			model.load('1')
		end

		context 'the file is valid' do
			before do
				allow(model.validation).to receive(:valid_dictionary?).and_return(true)
			end

			it 'returns true' do
				expect(model.load('')).to eq(true)
			end

			it 'calls loader#load' do
				expect(model.loader).to receive(:load)
				model.load('')
			end
		end

		context 'the file is invalid' do
			before do
				allow(model.validation).to receive(:valid_dictionary?).and_return(false)
			end

			it 'returns false' do
				expect(model.load('')).to eq(false)
			end

			it 'does not call loader#load' do
				expect(model.loader).to_not receive(:load)
				model.load('')
			end
		end
	end

	describe '#search' do
		before do
			allow(model.loader).to receive(:words).and_return(['foo', 'bar'])
		end

		it 'calls validation#valid_search?' do
			expect(model.validation).to receive(:valid_search?)
			model.search('')
		end

		context 'the search is valid' do
			it 'returns true' do
				expect(model.search('1 asdf')).to eq(true)
			end

			it 'calls analyzer search type' do
				expect(model.analyzer).to receive(:exactly_matches)
				model.search('1 asdf')
				expect(model.analyzer).to receive(:partially_matches)
				model.search('2 asdf')
				expect(model.analyzer).to receive(:begins_with)
				model.search('3 asdf')
				expect(model.analyzer).to receive(:ends_with)
				model.search('4 asdf')
			end
		end

		context 'the search is invalid' do
			it 'returns false' do
				expect(model.search('asdf')).to eq(false)
			end

			it 'does not call analyzer search type' do
				expect(model.analyzer).to_not receive(:exactly_matches)
				model.search('1asdf')
				expect(model.analyzer).to_not receive(:partially_matches)
				model.search('2asdf')
				expect(model.analyzer).to_not receive(:begins_with)
				model.search('3asdf')
				expect(model.analyzer).to_not receive(:ends_with)
				model.search('4asdf')
			end
		end
	end

	# 
	# 

	describe '#filename' do
		it 'calls validation#valid_filename?' do
			expect(model.validation).to receive(:valid_filename?)
			model.filename('')
		end

		context 'the filename is valid' do
			it 'calls validation#overwrite?' do
				expect(model.validation).to receive(:overwrite?)
				model.filename('')
			end

			context 'the file does not exist' do
				it 'returns true' do
					allow(model.saver).to receive(:overwrite?).and_return(false)
					expect(model.filename('file.txt')).to eq(true)
				end
			end

			context 'the file does exist' do
				it 'returns false' do
					allow(model.saver).to receive(:overwrite?).and_return(true)
					expect(model.filename('file.txt')).to eq(false)
				end
			end
		end

		context 'the filename is invalid' do
			it 'returns false' do
				expect(model.filename('!@#$')).to eq(false)
			end
		end
	end
end


require 'spec_helper'

describe DictionaryValidation do
	let(:loader){instance_double('DictionaryLoader', :files => [])}
	let(:saver){instance_double('DictionarySaver', :overwrite? => '')}
	let(:model){instance_double('DictionaryModel')}
	let(:validation){DictionaryValidation.new(:model => model)}

	before do
		allow(model).to receive(:loader).and_return(loader)
		allow(model).to receive(:saver).and_return(saver)
	end

	describe '#initialize' do
		it 'returns an instance of the DictionaryValidation class' do
			expect(validation).to be_an_instance_of(DictionaryValidation)
		end

		it 'accepts an options hash' do
			expect do
				validation
			end.to_not raise_error
		end
	end

	describe '#valid_dictionary?' do
		before do
			allow(model.loader).to receive(:files).and_return(['dictionary.txt'])
		end

		it 'returns true when the dictionary is a valid dictionary file' do
			expect(validation.valid_dictionary?('1')).to eq(true)
		end

		it 'returns false when the file is an invalid dictionary file' do
			expect(validation.valid_dictionary?('2')).to eq(false)
		end

		it 'sets an error message when returning false' do
			validation.valid_dictionary?('2')
			expect(validation.error).to be_kind_of(String)
		end
	end

	describe '#valid_search?' do
		it 'returns true if the search type is valid' do
			expect(validation.valid_search?('1 foo')).to eq(true)
		end

		it 'returns false if the search type is invalid' do
			expect(validation.valid_search?('asdf')).to eq(false)
		end

		it 'sets an error message when returning false' do
			validation.valid_search?('asdf')
			expect(validation.error).to be_kind_of(String)
		end
	end

	describe '#valid_yes_or_no?' do
		it 'returns true if the value is y, yes, n, or no' do
			expect(validation.valid_yes_or_no?('y')).to eq(true)
			expect(validation.valid_yes_or_no?('yes')).to eq(true)
			expect(validation.valid_yes_or_no?('n')).to eq(true)
			expect(validation.valid_yes_or_no?('no')).to eq(true)
		end

		it 'returns false if the value is not y, yes, n, or no' do
			expect(validation.valid_yes_or_no?('asdf')).to eq(false)
		end

		it 'sets an error message when returning false' do
			validation.valid_yes_or_no?('asdf')
			expect(validation.error).to be_kind_of(String)
		end
	end

	describe '#valid_filename?' do
		it 'returns true if the filename is valid' do
			expect(validation.valid_filename?('myfile.txt')).to eq(true)
		end

		it 'returns false if the filename is invalid' do
			expect(validation.valid_filename?('!@#$%^&*()_+')).to eq(false)
		end

		it 'sets an error message when returning false' do
			validation.valid_filename?('!@#$%^&*()_+')
			expect(validation.error).to be_kind_of(String)
		end
	end

	describe '#allow_overwrite?' do
		it 'returns true when the first word of the value is overwrite' do
			expect(validation.allow_overwrite?('overwrite asdf')).to eq(true)
		end
	end

	describe '#overwrite?' do
		before do
			allow(model.saver).to receive(:filename)
		end

		it 'returns true when saving the file will overwrite an existing file' do
			allow(model.saver).to receive(:overwrite?).and_return(true)
			expect(validation.overwrite?).to eq(true)
		end

		it 'returns false when saving the file will not overwrite an existing file' do
			allow(model.saver).to receive(:overwrite?).and_return(false)
			expect(validation.overwrite?).to eq(false)
		end
	end

	describe '#yes?' do
		it 'returns true if the input is y or yes' do
			expect(validation.yes?('y')).to eq(true)
		end
	end

	describe '#no?' do
		it 'returns true if the input is n or no' do
			expect(validation.no?('n')).to eq(true)
		end
	end
end
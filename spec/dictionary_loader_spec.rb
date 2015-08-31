require 'spec_helper'

describe DictionaryLoader do
	let(:dictionary_file){instance_double('File')}
	let(:loader) do
		DictionaryLoader.new(
			:words => ['foo', 'bar', 'baz'],
			:file => 'dictionary.txt',
			:path => File.dirname(__FILE__)
		)
	end

	before do
		allow(File).to receive(:open).and_yield(dictionary_file)
		allow(dictionary_file).to receive(:readlines).and_return([
			"One\n",
			"Two\n",
			"Three\n",
			"Four\n",
			"Five\n"
		])
	end

	describe '#initialize' do
		it 'returns an instance of the DictionaryLoader class' do
			expect(loader).to be_an_instance_of(DictionaryLoader)
		end

		it 'accepts a options hash' do
			expect {loader}.to_not raise_error
		end

		it 'accepts an array of words in options' do
			expect {loader}.to_not raise_error
		end

		it 'accepts a file to load in options' do
			expect {loader}.to_not raise_error
		end

		it 'accepts an absolute path to the dictionaries directory in options' do
			expect {loader}.to_not raise_error
		end

		it 'calls #load' do
			expect(File).to receive(:file?)
			loader
		end
	end

	describe '#file' do
		it 'is a reader' do
			expect {loader.file}.to_not raise_error
			expect {loader.file = nil}.to raise_error(NoMethodError)
		end

		it 'is the name of the file currently loaded as a dictionary' do
			expect(loader.file).to eq('dictionary.txt')
		end
	end

	describe '#path' do
		it 'is an accessor' do
			expect do
				loader.path
				loader.path = nil
			end.to_not raise_error
		end

		it 'is the absolue path to the dictionary directory' do
			expect(loader.path).to eq(File.dirname(__FILE__))
		end
	end

	describe '#words' do
		it 'is an accessor' do
			expect do
				loader.words
				loader.words = nil
			end.to_not raise_error
		end
	end

	describe '#load' do
		it 'takes a string as a parameter' do
			expect {loader.load('')}.to_not raise_error
		end

		it 'loads each line of the given file into the words array' do
			allow(File).to receive(:file?).and_return(true)
			loader.load('')
			expect(loader.words).to eq([
				"One",
				"Two",
				"Three",
				"Four",
				"Five"
			])
		end

		it 'returns true when it is successful' do
			allow(File).to receive(:file?).and_return(true)
			expect(loader.load('')).to eq(true)
		end

		it 'returns false when it fails' do
			allow(File).to receive(:file?).and_return(false)
			expect(loader.load('')).to eq(false)
		end
	end

	describe '#files' do
		it 'returns an array of all of the dictionary files in the dictionary directory' do
			expect(loader.files).to be_kind_of(Array)
		end
	end

	describe '#can_load?' do
		it 'takes a file name as a parameter' do
			expect {loader.can_load?('')}.to_not raise_error
		end

		it 'returns true if the dictionary file exists' do
			allow(File).to receive(:file?).and_return(true)
			expect(loader.can_load?('')).to eq(true)
		end

		it 'returns false if the dictionary file does not exist' do
			allow(File).to receive(:file?).and_return(false)
			expect(loader.can_load?('')).to eq(false)
		end
	end
end




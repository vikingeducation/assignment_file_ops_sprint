require 'spec_helper'

describe DictionarySaver do
	let(:saver) do 
		DictionarySaver.new(
			:dictionary => ["One", "Two", "Three", "Four"],
			:filename => 'dictionary.txt'
		)
	end

	describe '#initialize' do
		it 'returns an instance of the DictionarySaver class' do
			expect(saver).to be_an_instance_of(DictionarySaver)
		end

		it 'accepts a hash of options' do
			expect {saver}.to_not raise_error
		end

		it 'accepts a dictionary to save' do
			expect {saver}.to_not raise_error
		end

		it 'accepts a filename under which to save the dictionary' do
			expect {saver}.to_not raise_error
		end
	end

	describe '#dictionary' do
		it 'is an accessor' do
			expect do
				saver.dictionary
				saver.dictionary = nil
			end.to_not raise_error
		end
	end

	describe '#filename' do
		it 'is an accessor' do
			expect do
				saver.filename
				saver.filename = nil
			end.to_not raise_error
		end
	end

	describe '#save' do
		let(:file){instance_double('File')}

		it 'writes the data from the dictionary array to a file at the path filename' do
			allow(file).to receive(:write)
			allow(File).to receive(:open).and_yield(file)
			expect(File).to receive(:open).with('dictionary.txt', 'w')
			saver.save
		end
	end

	describe '#overwrite?' do
		it 'returns true if the save will overwrite a file' do
			allow(File).to receive(:file?).and_return(true)
			expect(saver.overwrite?).to eq(true)
		end

		it 'returns false if the save will create a new file' do
			allow(File).to receive(:file?).and_return(false)
			expect(saver.overwrite?).to eq(false)
		end
	end
end







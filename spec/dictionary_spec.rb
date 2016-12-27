require "dictionary.rb"

describe Dictionary do

	let(:a_dict) {Dictionary.new}

	describe '#initialize' do

		it 'initializes instance variables properly' do
			expect(a_dict.word_count).to eq(0)
			expect(a_dict.words).not_to be_nil
		end

	end

	describe '#calculate' do

		it 'calculates word count properly for a dictionary' do
			a_dict.words << "akbar"
			a_dict.words << "behdad"
			a_dict.words << "behrad"
			expect(a_dict.word_count).to eq(3)
		end

		it 'calculates first char frequencies properly' do
			a_dict.words << "akbar"
			a_dict.words << "behdad"
			a_dict.words << "behrad"
			a_dict.words << "ahmad"
			expect(a_dict.frequencies("b")).to eq(2)
		end

		it 'calculates all frequencies per char properly' do
			a_dict.words << "akbar"
			a_dict.words << "behdad"
			a_dict.words << "behrad"
			a_dict.words << "ahmad"
			a_dict.words << "cat"
			char_frequencies = a_dict.all_frequencies
			expect(char_frequencies["a"]).to eq(2)
			expect(char_frequencies["c"]).to eq(1)
			expect(char_frequencies["d"]).to eq(0)
		end
	end

end

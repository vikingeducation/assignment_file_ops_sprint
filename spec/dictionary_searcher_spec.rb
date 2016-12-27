require "dictionary_searcher.rb"

describe DictionarySearcher do

	let(:a_dict) {double("Dictionary", words: ["akbar", "ahmad", "behdad", "behrad", "karim"])}

	describe '#operations' do

		it 'properly find partial matches' do
			the_matches = DictionarySearcher.partial_match(a_dict, "ar")
			expect(the_matches.size).to eq(2)
			expect(the_matches.include?("akbar")).to be true
			expect(the_matches.include?("behdad")).to be false
			expect(the_matches.include?("karim")).to be true
		end

		it 'properly find begin_with matches' do
			the_matches = DictionarySearcher.begin_with_match(a_dict, "beh")
			expect(the_matches.size).to eq(2)
			expect(the_matches.include?("behdad")).to be true
			expect(the_matches.include?("behrad")).to be true
			expect(the_matches.include?("karim")).to be false
		end

		it 'properly find end_with matches' do
			the_matches = DictionarySearcher.end_with_match(a_dict, "ad")
			expect(the_matches.size).to eq(3)
			expect(the_matches.include?("behdad")).to be true
			expect(the_matches.include?("behrad")).to be true
			expect(the_matches.include?("ahmad")).to be true
			expect(the_matches.include?("karim")).to be false
		end

		it 'properly find exact matches when no match' do
			the_matches = DictionarySearcher.exact_match(a_dict, "behnam")
			expect(the_matches.size).to eq(0)
			expect(the_matches.include?("akbar")).to be false
			expect(the_matches.include?("behdad")).to be false
			expect(the_matches.include?("karim")).to be false
		end

		it 'properly find exact matches when match' do
			the_matches = DictionarySearcher.exact_match(a_dict, "karim")
			expect(the_matches.size).to eq(1)
			expect(the_matches.include?("akbar")).to be false
			expect(the_matches.include?("behdad")).to be false
			expect(the_matches.include?("karim")).to be true
		end

	end

end
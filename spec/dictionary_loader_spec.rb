require "dictionary_loader.rb"

describe DictionaryLoader do

	let(:a_good_path1) {"/Users/behdad/Developer/Viking/ruby/assignment_file_ops_sprint/dictionaries/5desk.txt"}
	let(:a_good_path2) {"/Users/behdad/Developer/Viking/ruby/assignment_file_ops_sprint/dictionaries/2of12inf.txt"}
	let(:a_bad_path) {"/Users/behdad/Developer/Viking/ruby/assignment_file_ops_sprint/dictionaries/6desk.txt"}

	describe '#create' do

		it 'properly creates a dictionary class' do
			the_dictionary = DictionaryLoader.generate_a_dictionary_from_file(a_good_path1)
			expect(the_dictionary).to be_a_kind_of(Dictionary)
		end

		it 'has correct number of words for 5desk dict' do
			the_dictionary = DictionaryLoader.generate_a_dictionary_from_file(a_good_path1)
			expect(the_dictionary.word_count).to eq(61406)
		end

		it 'has correct number of words for 5desk dict' do
			the_dictionary = DictionaryLoader.generate_a_dictionary_from_file(a_good_path2)
			expect(the_dictionary.word_count).to eq(81536)
		end

	end

end
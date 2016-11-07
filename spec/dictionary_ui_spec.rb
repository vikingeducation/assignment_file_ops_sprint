require 'dictionary_ui'

describe 'DictionaryUI' do

  let(:our_dictionary) { DictionaryUI.new }

  describe "#gets_dictionary_filepath" do

    it "gets location of dictionary from user" do
      allow(our_dictionary).to receive(:gets).and_return "dictionary.txt"
      expect(our_dictionary.gets_dictionary_filepath).to eq("dictionary.txt")
    end

  end

end
# spec/dictionary_ui_spec.rb

require 'dictionary_ui'

describe "DictionaryUI" do
  let(:dict_ui) { DictionaryUI.new }

  describe "#initialize" do
    it "creates an instance of DictionaryUI" do
      expect(dict_ui).to be_a(DictionaryUI)
    end
  end

  describe "#ask_for_filename" do
    it "prompts the user for the location of the dictionary file" do
      allow(dict_ui).to receive(:gets).and_return("my_dictionary_file.txt")
      expect(dict_ui).to receive(:gets)
      dict_ui.ask_for_filename
    end

    it "exits the program if the user has entered 'q'" do
      allow(dict_ui).to receive(:gets).and_return('q')
      expect { dict_ui.ask_for_filename }.to raise_error(SystemExit)
    end

    it "returns the user input" do
      allow(dict_ui).to receive(:gets).and_return("my_dictionary_file.txt")
      expect(dict_ui.ask_for_filename).to eq("my_dictionary_file.txt")
    end
  end
end
# spec/dictionary_ui_spec.rb

require 'dictionary_ui'

describe "DictionaryUI" do
  let(:dict_ui) { DictionaryUI.new }

  describe "#intialize" do
    it "creates an instance of DictionaryUI" do
      expect(dict_ui).to be_a(DictionaryUI)
    end
  end

  describe "prompt" do
    it "prompts the user for the location of the dictionary file"

    it "exits the program if the user has entered 'q'"

    it "returns the user input"
  end
end
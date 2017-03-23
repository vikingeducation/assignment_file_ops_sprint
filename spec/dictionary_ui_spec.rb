# spec/dictionary_ui_spec.rb

require 'dictionary_ui'

describe "DictionaryUI" do
  let(:dict_ui) { DictionaryUI.new }

  before(:each) do
    allow(dict_ui).to receive(:print).and_return(nil)
    allow(dict_ui).to receive(:puts).and_return(nil)
  end

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

  describe "#ask_for_search_type" do
    it "prompts the user for the type of search" do
      expect(dict_ui).to receive(:gets).and_return("1")
      dict_ui.ask_for_search_type
    end

    it "loops until the user has entered a valid search choice" do
      allow(dict_ui).to receive(:gets).and_return("5", "6", "3")
      expect(dict_ui).to receive(:gets).exactly(3).times
      dict_ui.ask_for_search_type
    end

    it "returns the valid user choice" do
      allow(dict_ui).to receive(:gets).and_return("2")
      expect(dict_ui.ask_for_search_type).to eq("2")
    end
  end

  describe "#ask_for_search_term" do
    it "prompts the user for his search term" do
      expect(dict_ui).to receive(:gets).and_return("fox")
      dict_ui.ask_for_search_term
    end

    it "returns the user's search term" do
      allow(dict_ui).to receive(:gets).and_return("foobar")
      expect(dict_ui.ask_for_search_term).to eq("foobar")
    end
  end

  describe "#save_results?" do
    it "asks the user if results should be saved" do
      expect(dict_ui).to receive(:gets).and_return("n")
      dict_ui.save_results?
    end

    it "returns true if the user enters 'y'" do
      allow(dict_ui).to receive(:gets).and_return("y")
      expect(dict_ui.save_results?).to be true
    end

    it "returns false if the user enters 'n'" do
      allow(dict_ui).to receive(:gets).and_return("n")
      expect(dict_ui.save_results?).to be false
    end

    it "exits the program if the user enters 'q'" do
      allow(dict_ui).to receive(:gets).and_return("q")
      expect { dict_ui.save_results? }.to raise_error(SystemExit)
    end
  end

  describe "#ask_for_filename_to_save_to" do
    it "asks the user for the filename to save to"

    it "if the file already exists, it asks the user if it should be overwritten"

    it "if the file should not be overwritten, it prompts the user again"

    it "returns the filename to save to"
  end
end
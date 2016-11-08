require "rspec"
require "dictionary_ui"

describe DictionaryUI do
  let(:ui) {DictionaryUI.new}
  describe "#welcome" do
    it "prints a welcome message" do
      expect(ui).to receive(:puts).exactly(3).times
      ui.welcome
    end
  end 

  describe "#instructions" do
    it "prints instructions to the screen" do
      expect(ui).to receive(:puts).exactly(3).times
      ui.instructions
    end
  end

  describe "#listen" do 
    it "gets user input" do
      expect(ui).to receive(:gets).and_return("word")
      ui.listen
    end
  end
end
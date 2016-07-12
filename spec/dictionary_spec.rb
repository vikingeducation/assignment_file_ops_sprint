require "dictionary"

describe Dictionary do
  let(:dict) { Dictionary.new(["Apple", "Banana"])}

  it "loads words into the dictionary" do
    expect(dict.words).to_not eq([])
  end
end

describe DictionaryUI do
  let(:dict_ui) { DictionaryUI.new }
  
  describe "#run" do
    it "raises a ENOENT error if the file doesn't exist" do
      allow(STDOUT).to receive(:puts)
      allow(STDIN).to receive(:gets).and_return("fake_file.txt","fake_dict.txt")
      expect { dict_ui.run }.to raise_error(SystemCallError)
    end
  end

  describe "#prompt_for_input" do
    # it "prints the prompt" do
    #   expect(STDOUT).to receive(:puts)
    #   dict_ui.prompt_for_input("PROMPT")
    # end

    it "returns user input"
  end
end

describe DictionaryLoader do
  it "transfers words from a file to an array" do
    expect(DictionaryLoader.load("5desk.txt"))
      .to be_an_instance_of(Array)
    p DictionaryLoader.load("5desk.txt")
  end
end

describe DictionarySearcher do
end

describe ResultsSaver do
end





#controller dictionary
 # load dictionary [loader]
 # 
#UI
#Loader - loads from file
#Searcher
#results
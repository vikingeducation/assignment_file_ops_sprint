require "dictionary"

describe Dictionary do
  let(:dict) { Dictionary.new(["Apple", "Banana"])}

  it "loads words into the dictionary" do
    expect(dict.words).to_not eq([])
  end
end

describe DictionaryUI do
  let(:dict_ui) { DictionaryUI.new }
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
    expect(DictionaryLoader.load("fake_dict.txt"))
      .to be_an_instance_of(Array)
    p DictionaryLoader.load("fake_dict.txt")
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
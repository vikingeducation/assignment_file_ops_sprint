require 'dictionary-loader'

describe DictionaryLoader do
  before do
    allow($stdout).to receive(:puts)
  end
  let(:valid_path) {'./5desk.txt'}
  let(:loader){DictionaryLoader.new(valid_path)}
  describe "#get_dictionary" do
    it "creates dictionary if given path is valid" do
      # allow(loader).to receive(:valid_path?).and_return(true)
      loader.get_dictionary
      expect(loader.dictionary).to be_a(Dictionary)
    end
  end

  describe "#valid_path?" do
    it "returns true if the path is valid" do
      expect(loader.valid_path?).to eq(true)
    end
  end

  describe "#success_message" do
  #   it "calls #num_words" do
  #     loader.get_dictionary
  #     expect(loader.dictionary).to receive(:num_words).and_return(10)
  #   end
    it "calls #read_frequency" do
      expect(loader).to receive(:read_frequency).and_return(nil)
      loader.get_dictionary
    end
  end
end

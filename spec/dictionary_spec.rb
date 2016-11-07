require 'dictionary'

describe Dictionary do
  describe "#initialize" do
    it "returns a dictionary with the correct data" do
      data = File.read(file_path)
      filled_dictionary = Dictionary.new(data)
      expect(DictionaryLoader.load("./5desk.txt").data)
    end

    
  end
end

require 'dictionaryloader'

describe DictionaryLoader do
  
  let(:dictionary) { ["alpha\r\n", "bravo\r\n", "charlie\r\n"] }

  describe ".open(dictionary)" do
    
    it "returns a clean array of words from the specified file" do
      expect(File).to receive(:readlines) { dictionary }
      d = DictionaryLoader::open(dictionary)
      expect( d ).to eq( ["alpha", "bravo", "charlie"] )
    end

    it "raises an error if the file doesn't exist" do
      error = "No such file or directory @ rb_sysopen - blah"
      expect{ DictionaryLoader::open("blah") }.to raise_error(error)
    end

  end
end
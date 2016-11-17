describe "Dictionary" do 


  let(:dictionary){ Dictionary.new(["a","b","c"])}
  describe "#words_by_letter" do 
    it "returns a hash" do 
      expect(dictionary.words_by_letter).to be_a(Hash)
    end
  end
end
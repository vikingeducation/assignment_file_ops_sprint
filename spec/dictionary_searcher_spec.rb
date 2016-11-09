describe "DictionarySearcher" do 

  let(:dictionary) { %w(Star starry stardom gangstar fandom fanny farce gfan).map { |word| word.upcase } }
  let(:searcher){ DictionarySearcher.new(dictionary) }
  
  describe "#search" do 

    context "exact match" do 
      it "returns exact matches" do
        expect(searcher.search(1, "star")).to eq(["STAR"])
      end
    end 

    context "partial match" do 
      it "returns a partial match" do 
        expect(searcher.search(2, "star")).to eq(%w(STAR STARRY STARDOM GANGSTAR))
      end
    end

    context "starts with match" do 
      it "returns matches that start with term" do 
        expect(searcher.search(3, "fan")).to eq(%w(FANDOM FANNY))
      end
    end

    context "ends with match" do 
      it "returns matchse that end with term" do 
        expect(searcher.search(4, "dom")).to eq(%w(STARDOM FANDOM))
      end
    end
  end
end 
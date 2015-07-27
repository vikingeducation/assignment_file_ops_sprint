require 'dictionaryanalyzer'

context DictionaryAnalyzer do

  let(:dictionary) { ["alpha", "bravo", "charlie", "apples"] }
  let(:tester) { DictionaryAnalyzer.new(dictionary) }

  describe "#total_words" do
    it "returns the number of words in the dictionary" do
      expect( tester.total_words ).to eq(4)
    end
  end

  describe "#word_count_by_letter" do
    it "returns a hash with the number of words that start with each letter" do
      expect( tester.word_count_by_letter ).to eq( {:A => 2, :B => 1, :C => 1} )
    end
  end

  context "searching" do

    let(:search_dictionary) { ["applejack", "dapple", "grappler", "apple", "blah"] }
    let(:test_search) { DictionaryAnalyzer.new(search_dictionary) }
    
    describe "#search(:exact, 'term')" do
      it "set results to an exact match, if one exists" do
        test_search.search(:exact, 'apple')
        expect( test_search.results ).to match_array( ["apple"] )
      end
    end

    describe "#search(:partial, 'term')" do
      it "set results to all words that contain the search term" do
        test_search.search(:partial, 'apple') 
        expect( test_search.results ).to match_array( 
          ["applejack", "dapple", "grappler", "apple"] )
      end
    end

    describe "#search(:begins, 'term')" do
      it "set results to all words that begin with the search term" do
        test_search.search(:begins, 'apple')
        expect( test_search.results ).to match_array(
          ["apple", "applejack"] )
      end
    end

    describe "#search(:ends, 'term')" do
      it "set results to all words that end with the search term" do
        test_search.search(:ends, 'apple')
        expect( test_search.results ).to match_array(
          ["dapple", "apple"])
      end
    end

    describe "#output_results(filename)" do
      it "outputs search results to a file" do
        expect( File ).to receive(:open).with("filename", "w")
        subject.output_results("filename")
      end
    end

  end


end
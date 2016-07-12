# dictionary_searcher_spec.rb
require 'dictionary_searcher'

describe 'DictionarySearcher' do

  let (:dict_double) {
    ["A", "a", "Aachen", "Aalborg", "aardvark", "Aarhus", "Aaron",
     "AB", "Ab", "abaci", "aback", "abacus", "Abadan", "abaft",
     "abalone", "abandon", "abandoned", "abandonedly", "abandonment",
     "abase", "abasement", "abash", "abashed", "abashedly", "abashment",
     "abate", "abatement", "abattoir", "abbacy", "abbe"] }

  let (:input1) { "aardvark" }
  let (:input2) { "ate" }
  let (:input3) { "abandonment" }
  let (:input4) { "aback" }
  
  describe '.exact_match' do
    let (:exact_matches) { DictionarySearcher
      .exact_match(dict_double,input1) }

    it 'returns an exact match for a word' do
      expect(exact_matches).to eq("aardvark")
    end
  end

  describe '.partial_match' do
    let (:partial_match){ DictionarySearcher
      .partial_match(dict_double,"ate")}

    it "returns an array of words that partially matches an input" do
      expect(partial_match).to eq(["abate","abatement"])
    end
  end

  describe '.begins_with' do
    let (:begins_with_match){ DictionarySearcher
      .begins_with(dict_double,"Abb")}

    it "returns an array of words which begin with an input" do
      expect(begins_with_match).to eq(["abbacy", "abbe"])
    end
  end

  describe '.ends_with' do
    let (:ends_with_match){ DictionarySearcher
      .ends_with(dict_double,"ON")}

    it "returns an array of words which ends with an input" do
      expect(ends_with_match).to eq(["Aaron", "abandon"])
    end
  end

end




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
  let (:input2) { "abate" }
  let (:input3) { "abandonment" }
  let (:input4) { "aback" }
  
  describe '.exact_match' do
    let (:exact_matches) { DictionarySearcher.exact_match(dict_double,
                                                          input1) }

    it 'returns an exact match for a word' do
      expect(exact_matches).to eq("aardvark")
    end
  end
end


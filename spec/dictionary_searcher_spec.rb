require 'dictionary'
require 'dictionary_searcher'

describe DictionarySearcher do

  let(:d){Dictionary.new}
  let(:ds){DictionarySearcher.new(d)}

  before(:each) {d.array = ["word", "curry", "woman"]}

  it 'is an instance of DictionarySearcher' do
    expect(ds).to be_a(DictionarySearcher)
  end

  # Again it's hard to test these because the input has already been tested previously and then the output is purely text.
  # What we really want to test is that the matched words go into the matches array.
  # This might be one of those times where we're gonna have to get a bit dirty and make the matches array into an instance variable, strictly for testing purposes.
  # Eventually we're going to save these results anyways so we're going to want to save,
  # the initial word that was searched for,
  # the type of search that was done,
  # the number of matches and
  # the words that matched.####
  describe 'exact_match' do
    it 'puts the exact matches into @matches' do
      ds.exact_match("word")
      expect(ds.matches).to eq(["word"])
    end

    it "does not put words that dont match" do
      ds.exact_match("word")
      expect(ds.matches).not_to eq(["word","curry"])
    end
  end

  describe 'partial_match' do
    it 'puts the partial matched words into @matches' do
      ds.partial_match("wo")
      expect(ds.matches).to eq(["word", "woman"])
    end

    it 'puts the partial matched words into @matches' do
      ds.partial_match("r")
      expect(ds.matches).to eq(["word", "curry"])
    end

    it "does not put words that dont match" do
      ds.partial_match("xx")
      expect(ds.matches).not_to eq(["word","curry","woman"])
    end
  end

  describe 'beging_with' do
    it 'puts the words that begin with searched word into @matches' do
      ds.begins_with("wo")
      expect(ds.matches).to eq(["word", "woman"])
    end

    it "doesn't put the words that don't begin with searched word into @matches" do
      ds.begins_with("ur")
      expect(ds.matches).to eq([])
    end

    it "doesn't put the words that don't begin with searched word into @matches" do
      ds.begins_with("r")
      expect(ds.matches).to eq([])
    end

    it 'puts the words that begin with searched word into @matches' do
      ds.begins_with("wo")
      expect(ds.matches).to eq(["word","woman"])
    end
  end

  describe 'ends_with' do
    it 'puts the words that ends with searched word into @matches' do
      ds.ends_with("rd")
      expect(ds.matches).to eq(["word"])
    end

    it "doesn't put the words that don't end with searched word into @matches" do
      ds.ends_with("xxx")
      expect(ds.matches).to eq([])
    end

    it "doesn't put the words that don't end with searched word into @matches" do
      ds.ends_with("n")
      expect(ds.matches).to eq(["woman"])
    end

    it 'puts the words that end with searched word into @matches' do
      ds.ends_with("y")
      expect(ds.matches).to eq(["curry"])
    end

  end

end
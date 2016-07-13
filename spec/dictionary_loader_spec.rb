require 'dictionary_loader'

describe 'DictionaryLoader' do

  let(:dictionary_file){ "5desk.txt" }
  let(:dictionary){ DictionaryLoader.load(dictionary_file) }

  describe '.load' do
    it "correctly loads the first element from dictionary text file" do
      expect(dictionary[0]).to eq("A")
    end

    it "correctly loads the last element from dictionary text file" do
      expect(dictionary[-1]).to eq("Zzz")
    end
  end

end


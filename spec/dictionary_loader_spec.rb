require 'dictionary_loader'

describe 'DictionaryLoader' do

  describe '.load' do
    it "Loads a file" do
      allow(DictionaryLoader).to receive(:load)
    end
  end

end
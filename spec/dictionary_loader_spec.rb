require 'dictionary_loader'
require 'dictionary'

describe DictionaryLoader do
  it 'returns a Dictionary' do
    allow(File).to receive(:readlines).and_return(['an_array'])
    expect(DictionaryLoader.load('whatever')).to be_a(Dictionary)
  end
end

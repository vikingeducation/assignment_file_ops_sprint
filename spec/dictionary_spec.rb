# dictionary_spec.rb
require 'dictionary'

describe 'Dictionary' do
  let (:my_dict) { Dictionary.new([]) }

  describe '#initialize' do
    it 'creates a new dictionary object' do
      expect(my_dict).to be_an_instance_of(Dictionary)
    end
  end

  describe '#dict' do
    it 'returns an array of dictionary words' do
      expect(my_dict.dict).to eq([])
    end
  end

end


require 'dictionary_ui'

describe DictionaryUI do

  describe '#initialize' do

    it 'raises KeyError unless passed a listener' do
      expect{DictionaryUI.new(renderer: "")}.to raise_error(KeyError)
    end

    it 'raises KeyError unless passed a renderer' do
      expect{DictionaryUI.new(listener: "")}.to raise_error(KeyError)
    end



  end

end

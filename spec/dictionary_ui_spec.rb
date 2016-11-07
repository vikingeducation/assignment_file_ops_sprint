require 'dictionary_ui'

describe DictionaryUI do 

  let(:dictionary_ui) { DictionaryUI.new }

  describe '#initialize' do 

    it 'starts with a blank dictionary path' do 
      expect(dictionary_ui.path).to be_nil
    end

  end

  describe '#run' do 

    it 'calls #get_path' do 
      allow(dictionary_ui.run).to receive(get_path)
      dictionary_ui.run
    end

  end

end
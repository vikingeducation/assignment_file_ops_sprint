require 'dictionary_ui'
require 'dictionary'
require 'dictionary_loader'
require 'dictionary_searcher'
require 'results_saver'

describe DictionaryUI do
  describe '#run' do
    it 'prints directions to the screen' do
      allow(subject).to receive(:gets).and_return('')
      expect(subject).to receive(:puts).with("Where is your dictionary?")
      subject.run
    end
  end
end
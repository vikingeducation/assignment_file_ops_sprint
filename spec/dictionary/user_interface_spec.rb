RSpec.describe DictionaryUI do
  let(:loader_spy) { spy('Dictionary::Loader') }
  let(:searcher_spy) { spy('Dictionary::Searcher') }
  let(:ui) do
    DictionaryUI.new(loader: loader_spy, searcher: searcher_spy)
  end

  before do
    allow(ui).to receive(:gets) { 'path/to/file' }
    allow(ui).to receive(:puts) { 'path/to/file' }
    allow(ui).to receive(:print) { 'path/to/file' }
  end

  describe 'loading dictionary' do
    it 'prompts user for dictionary location' do
      ui.run
      expect(loader_spy).to have_received(:load).with 'path/to/file'
    end

    it 'displays dictionary stats' do
      dictionary_spy = spy('Dictionary')
      allow(loader_spy).to receive(:load) { dictionary_spy }

      expect(DictionaryFormatter).to receive(:stats)
      ui.run
    end
  end
end
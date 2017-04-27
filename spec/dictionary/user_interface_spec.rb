RSpec.describe DictionaryUI do
  let(:loader_spy) { spy('Dictionary::Loader') }
  let(:ui) do
    DictionaryUI.new(loader: loader_spy)
  end

  before do
    allow(ui).to receive(:gets) { 'path/to/file' }
    allow(ui).to receive(:puts) { 'path/to/file' }
    allow(ui).to receive(:print) { 'path/to/file' }

    allow(DictionaryFormatter).to receive :results
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

  describe 'running a search' do
    it 'presents a search option menu' do
      expect(ui).to receive :search_menu
      ui.run
    end

    it 'prompts user for choice' do
      expect(ui).to receive :search_type_choice
      ui.run
    end

    it 'prompts user for search term' do
      expect(ui).to receive :search_term
      ui.run
    end

    it 'performs chose search type with term' do
      search_term = 'cat'
      allow(ui).to receive(:search_type_choice) { 2 }
      allow(ui).to receive(:search_term) { search_term }

      expect_any_instance_of(DictionarySearcher)
        .to receive(:partial_match).with search_term
      ui.run
    end
  end
end
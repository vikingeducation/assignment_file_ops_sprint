class DictionaryUI
  attr_reader :loader

  def initialize(loader:, searcher:)
    @loader = loader
  end

  def run
    path = data_path
    @loader.load path
  end

  private

  def data_path
    print 'Enter file path to dictionary: '
    gets.chomp
  end
end

RSpec.describe DictionaryUI do
  let(:loader_spy) { spy('Dictionary::Loader') }
  let(:searcher_spy) { spy('Dictionary::Searcher') }
  let(:ui) do
    DictionaryUI.new(loader: loader_spy, searcher: searcher_spy)
  end

  describe 'loading dictionary' do
    it 'prompts user for dictionary location' do
      allow(ui).to receive(:gets) { 'path/to/file' }
      ui.run
      expect(loader_spy).to have_received(:load).with 'path/to/file'
    end

    it 'displays dictionary stats' do
      ui.run

      expect_any_instance_of(Dictionary).to have_received(:show_stats)
    end
  end
end
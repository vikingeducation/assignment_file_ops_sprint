module Dictionary
  class UserInterface
    attr_reader :loader

    def initialize(loader:, searcher:)
      @loader = loader
    end

    def start
      path = data_path
      @loader.load path
    end

    private

    def data_path
      print 'Enter file path to dictionary: '
      gets.chomp
    end
  end
end

RSpec.describe Dictionary::UserInterface do
  let(:loader_spy) { spy('Dictionary::Loader') }
  let(:searcher_spy) { spy('Dictionary::Searcher') }
  let(:ui) do
    Dictionary::UserInterface.new(loader: loader_spy, searcher: searcher_spy)
  end

  describe 'loading dictionary' do
    it 'prompts user for dictionary location' do
      allow(ui).to receive(:gets) { 'path/to/file' }
      ui.start
      expect(loader_spy).to have_received(:load).with 'path/to/file'
    end
  end
end
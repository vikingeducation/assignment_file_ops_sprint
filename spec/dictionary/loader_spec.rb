class DictionaryLoader
  def self.load(path)
    File.open(path, 'r') do |file|
      Dictionary.new(file.readlines)
    end
  end
end

class Dictionary
  def initialize(words)
  end
end

RSpec.describe DictionaryLoader do
  let(:loader) { DictionaryLoader }
  let(:path) { 'path/to/filename' }
  let(:stream_spy) { spy('File stream') }

  before do
    allow(stream_spy).to receive(:readlines)
    allow(File).to receive(:open).and_yield stream_spy
  end

  describe '#load' do
    it 'loads the file' do
      expect(File).to receive(:open).with(path, 'r')
      loader.load(path)
    end

    it 'returns a dictionary' do
      expect(loader.load(path)).to be_a_kind_of Dictionary
    end
  end
end
class DictionaryUI
  attr_reader :loader

  def initialize(loader:, searcher:)
    @loader = loader
  end

  def run
    path = data_path
    dictionary = @loader.load path
    puts DictionaryFormatter.stats(dictionary)
  end

  private

  def data_path
    print 'Enter file path to dictionary: '
    gets.chomp
  end
end

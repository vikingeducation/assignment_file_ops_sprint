class DictionaryUI
  attr_reader :loader

  def initialize(loader:, searcher:)
    @loader = loader
    @searcher = searcher
  end

  def run
    path = data_path
    dictionary = @loader.load path
    puts DictionaryFormatter.stats(dictionary)
    search_menu
    search_type = search_type_choice
    term = search_term
    search_results = perform_search(search_type, term)
    puts DictionaryFormatter.results(search_results)
  end

  private

  attr_reader :searcher

  def data_path
    print 'Enter file path to dictionary: '
    gets.chomp
  end

  def perform_search(type, term)
    case type
    when 1
      searcher.exact_match(term)
    when 2
      searcher.partial_match(term)
    when 3
      searcher.begins_with_match(term)
    when 4
      searcher.ends_with_match(term)
    else
      puts 'You done fudged up in your search term or search type choice.'
    end
  end

  def search_menu
    puts 'Search type menu:'
    puts '1: Exact'
    puts '2: Partial'
    puts '3: Begins with'
    puts '4: Ends with'
  end

  def search_term
    print 'Enter your search term: '
    gets.chomp
  end

  def search_type_choice
    print 'Enter number of search type you want: '
    gets.chomp.to_i
  end
end

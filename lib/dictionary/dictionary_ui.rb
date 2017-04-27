class DictionaryUI
  attr_reader :loader

  def initialize(loader:)
    @loader = loader
  end

  def run
    path = data_path
    puts 'Loading dictionary...'
    dictionary = @loader.load path
    puts DictionaryFormatter.stats(dictionary)

    search_menu
    search_type = search_type_choice
    term = search_term

    @searcher = DictionarySearcher.new(dictionary)
    search_results = perform_search(search_type, term)
    puts DictionaryFormatter.results(search_results)

    if save_results?
      file_path = file_to_save

      if file_exists?(file_path) && overwrite_file?
        ResultsSaver.save(file_path, search_results)
        puts 'File successfully overwritten!'
      else
        return
      end

      ResultsSaver.save(file_path, search_results)
    end

    puts 'OK, bye!'
  end

  private

  attr_reader :searcher

  def data_path
    print 'Enter file path to dictionary: '
    gets.chomp
  end

  def file_exists?(file)
    File.exists? file
  end

  def file_to_save
    puts 'What filepath should I write results to?'
    gets.chomp
  end

  def overwrite_file?
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

  def save_results?
    puts 'Do you want to save results? y/n'
    gets.chomp == 'y'
  end

  def search_menu
    puts 'Search type menu:'
    puts '1: Exact'
    puts '2: Partial'
    puts '3: Begins with'
    puts '4: Ends with'
  end

  def search_term
    print "\nEnter your search term: "
    gets.chomp
  end

  def search_type_choice
    print 'Enter number of search type you want: '
    gets.chomp.to_i
  end
end

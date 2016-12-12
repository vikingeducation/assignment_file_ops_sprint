class Dictionary

  attr_reader :processed

  def initialize(processed_dictionary)
    @processed = processed_dictionary
    @searcher = DictionarySearcher.new(@processed)
  end

  def search(type, term)
    case type
    when 1
      @searcher.exact(term)
    when 2
      @searcher.partial(term)
    when 3
      @searcher.begins_with(term)
    when 4
      @searcher.ends_with(term)
    end
  end

end

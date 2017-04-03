class DictionarySearcher
  attr_reader :dict

  def initialize(dict)
    @dict
  end

  def search
    # TODO: add case to determine which search method to run
  end

  def exact(term)
    matches = []
    # TODO: add regex
  end

  def partial(term)
    matches = []
    # TODO: add regex
  end

  def begins_with(term)
    matches = []
    # TODO: add regex
  end

  def ends_with(term)
    matches = []
    # TODO: add regex
  end

  def show_results
    # TODO: display search results
  end
end

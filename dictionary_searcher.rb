class DictionarySearcher
  attr_reader :dict

  def initialize(dict)
<<<<<<< HEAD
    @dict = dict
  end

  def search(type, term)
    case type
    when 1
      exact(term)
    when 2
      partial(term)
    when 3
      begins_with(term)
    when 4
      ends_with(term)
    end
  end

  def exact(term)
    @matches = []
    @dict.each { |word| @matches << word if /^#{term}$/ =~ word }
  end

  def partial(term)
    @matches = []
    @dict.each { |word| @matches << word if /.*#{term}.*/ =~ word }
  end

  def begins_with(term)
    @matches = []
    @dict.each { |word| @matches << word if /^#{term}/ =~ word }
  end

  def ends_with(term)
    @matches = []
    @dict.each { |word| @matches << word if /#{term}$/ =~ word }
  end

  def show_results
    puts "Found #{@matches.length} matches:"
    @matches.each { |word| puts word }
=======
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
>>>>>>> 02c57034b7dd04c1d19ef45d5890d0bec73fd14a
  end
end

class DictionarySearcher
  attr_reader :dict

  def initialize(dict)
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
  end
end

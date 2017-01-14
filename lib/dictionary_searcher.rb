# analysis class. performs any analysis on the dictionary provided

class DictionarySearcher
  attr_accessor :term
  def initialize(dictionary)
    @term
    @entries = dictionary.entries
  end

  def exact
    return [@term] if @entries.include?(@term)
  end

  def partial
    @entries.select { |word| word =~ /(.*)#{@term}(.*)/ }
  end

  def begins_with
    @entries.select{ |word| word.index(@term) == 0}
  end

  def ends_with
    @entries.select { |word| word.end_with?(@term) }
  end


end

class DictionarySearcher

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def search(mode, term)
    term = term.upcase
    mode = mode.to_i
    case mode
    when 1
      exact_search(term)
    when 2
      partial_search(term)
    when 3
      begins_with_search(term)
    when 4
      ends_with_search(term)
    else
      raise ArgumentError.new
    end
  end

  def exact_search(term)
    @dictionary.select { |entry| entry.strip == term }
  end
  
  def partial_search(term)
    search = /.*#{Regexp.quote(term)}.*/
    @dictionary.select { |entry| entry =~ search }
  end

  def begins_with_search(term)
    search = /\A#{Regexp.quote(term)}.*/
    @dictionary.select { |entry| entry =~ search }
  end

  def ends_with_search(term)
    search = /.*#{Regexp.quote(term)}\z/
    @dictionary.select { |entry| entry.strip =~ search }
  end
end
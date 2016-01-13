class DictionarySearcher
  def initialize(dictionary = Dictionary.new)
    @dictionary = dictionary
  end

  def search(term)
    results = []
    words.each do |word|
      results << word if yield(word)
    end
    results
  end

  def exact_match(term)
    search(term) { |word| word == term }
  end

  def partial_match(term)
    search(term) { |word| word =~ /#{term}/ }
  end

  def begins_with(term)
    search(term) { |word| word =~ /^#{term}/ }
  end

  def ends_with(term)
    search(term) { |word| word =~ /#{term}$/ }
  end

  private

  def words
    @dictionary.words
  end
end

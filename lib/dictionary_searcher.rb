class DictionarySearcher
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def search(term, type)
    term = term.downcase

    case type
    when 1
      matches { |word| word == term }
    when 2
      matches { |word| word.include? term }
    when 3
      matches { |word| word.start_with? term }
    when 4
      matches { |word| word.end_with? term }
    end
  end

  private

  def matches(&block)
    results = []

    @dictionary.words.each do |word|
      results << word if yield(word.downcase)
    end

    results
  end
end

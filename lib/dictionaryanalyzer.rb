class DictionaryAnalyzer
  attr_reader :results

  def initialize(dictionary = nil)
    @dictionary = dictionary    
  end


  def total_words
    @dictionary.length    
  end


  def word_count_by_letter
    letters = Hash.new(0)

    @dictionary.each do |word|
      letter = word[0].upcase.to_sym
      letters[letter] += 1
    end

    letters
  end


  def search(type, term)
    search_types = {:x => /^#{term}$/, :p => /#{term}/,
                    :b => /^#{term}/, :e => /#{term}$/}
    regex = search_types[type]

    @results = @dictionary.select do |word|
      word.match(regex)
    end    
  end


  def output_results(filename)
    File.open(filename, "w") do |file|
      @results.each { |word| file.puts(word) }
    end
  end

  
end
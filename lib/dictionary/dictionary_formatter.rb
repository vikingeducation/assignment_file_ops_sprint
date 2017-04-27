class DictionaryFormatter
  def self.stats(dictionary)
    stats = dictionary.stats
    display = "Your dictionary contains #{stats.word_count} words.\n"
    display += "Word frequency by starting letter:\n"
    stats.word_frequency.each do |letter, word_count|
      display += "#{letter.to_s.upcase}: #{word_count}\n"
    end

    display
  end

  def self.results(search_results)
    display = "Matched #{search_results.size}:\n"
    search_results.each do |r|
      display += "#{r}\n"
    end
  end
end
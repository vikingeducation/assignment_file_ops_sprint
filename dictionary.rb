class Dictionary
  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def word_count
    @entries.length
  end

  def word_frequency
    occurrences = Hash.new(0)
    @entries.each { |entry| occurrences[entry[0].downcase] += 1 }
    occurrences.each { |key, val| puts "#{key}: #{val}" }
  end

  def show_stats
    puts "Dictionary successfully loaded."
    puts "Your dictionary contains #{word_count} words."
    puts "Word frequency by starting letter:"
    word_frequency
  end
end

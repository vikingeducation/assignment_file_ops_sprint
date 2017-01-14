# the class which wraps the loaded dictionary.
class Dictionary
  attr_reader :entries

  def initialize(entries)
    @entries = entries
    @words = {}
    calculate_word_frequency
    print_stats
  end

  def print_stats
    puts "Your dictionary contains #{@entries.size} words. (A wordy dictionary indeed!)"
    @words.each do |letter, count|
      puts "#{letter.upcase}: #{count}"
    end
    puts
  end

  def calculate_word_frequency
    @entries.each do |word|
      l = word[0].downcase.to_sym
      if @words[l]
        @words[l] += 1
      else
        @words[l] = 1
      end
    end
  end

end

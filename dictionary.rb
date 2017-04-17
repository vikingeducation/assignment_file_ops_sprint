# holds dictionary instance and provides access
class Dictionary
  include Enumerable
  def initialize(word_array)
    @dict_words = word_array
  end

  def each(&block)
    @dict_words.each(&block)
  end

  def random_word
    @dict_words[rand(@dict_words.length)]
  end

  def stats
    stats = {}
    @dict_words.each do |word|
      stats[word[0].upcase] ? stats[word[0].upcase] += 1 : stats[word[0].upcase] = 1
    end
    puts "Your dictionary contains #{@dict_words.length} words."
    puts 'Word frequency by starting letter: '
    stats.each do |letter, count|
      puts "#{letter}: #{count}"
    end
  end
end

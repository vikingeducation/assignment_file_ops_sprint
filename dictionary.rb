# holds dictionary instance and provides access
class Dictionary
  def initialize(wordArray)
    @dict_words = wordArray
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

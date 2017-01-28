# wraps the loaded dictionary
class Dictionary

  attr_reader :dict

  def initialize(dict)
    @dict = dict
  end

  def stats
    puts ""
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{dict.count} words"
    puts "Word frequency by starting letter:"
    frequency_by_letter(dict).sort.each do |letter, val|
      puts "#{letter}: #{val}"
    end
  end

  def frequency_by_letter(dict)
    dict.reduce(Hash.new(0)) do |acc, word|
      acc[word[0].upcase] += 1
      acc
    end
  end

end

class DictionaryUI

  def input_path
    @file_path = input "Where's your dictionary?"
    @file_path.empty? ? "5desk.txt" : @file_path
  end

  def show_stats(stats)
    puts "Your dictionary contains #{stats[:total]} words."
    puts "Word frquency by starting letter"
    stats.each_pair {| key, value |
      puts "#{key} #{value}"
     }
  end
    # Dictionary successfully loaded
#
# Word frequency by starting letter:

  private

  def input(prompt)
    print "#{prompt}: "
    gets.chomp
  end
end

class DictionaryLoader
  @words = Array.new(1)
  def run
    d = DictionaryUI.new
    @file_path = d.input_path
    File.open(@file_path, "r") do |file|
      @words = file.readlines
    end
    @words.each do |word|
      word.chomp!
    end
  end
end

class Dictionary
  def initialize
    interface = DictionaryUI.new
    loader = DictionaryLoader.new
    @contents = loader.run
    analizer = DictionarySearcher.new
    stats = analizer.stats(@contents)
    interface.show_stats(stats)
  end

end

class DictionarySearcher
  @@ALPHABET = ("a".."z").to_a
  def stats(contents)
    total = contents.length
    stat_hash = Hash.new(0)
    i = 0
    j = 0
    while i < total do
      word = contents[i].downcase
      letter = @@ALPHABET[j]
      while word[0] != letter do
        j+= 1
        letter = @@ALPHABET[j]
      end
      stat_hash[letter.to_sym] += 1
      i+=1
    end
    stat_hash[:total] = total
    stat_hash
  end
end

class ResultSaver
end

Dictionary.new

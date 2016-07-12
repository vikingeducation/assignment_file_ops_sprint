# holds a list of words
class Dictionary
  attr_reader :words

  def initialize(words = [])
    @words = words
  end

  def word_count
    @words.length
  end
end

#reads in dictionary from file and creates Dictionary
class DictionaryLoader

  def self.load(filename)
    word_list = []

    word_list = File.readlines(filename).each do |line|
      word_list << line.gsub(/\\r\\n\z/, "")
    end

    word_list
  end

end

# finds matches in Dictionary
class DictionarySearcher
end

# saves results to disk
class ResultsSaver
end

# controls functions based on input
class DictionaryUI
  
  def prompt_for_input(prompt)
    puts prompt
    gets.chomp
  end
end
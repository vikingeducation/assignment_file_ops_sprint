#reads in dictionary from file and creates Dictionary
class DictionaryLoader

  def self.load(filename)
    word_list = []

    File.readlines(filename).each do |line|
      word_list << line.strip
    end

    word_list
  end

end
class DictionaryLoader

  attr_reader :words

  def initialize(dictionary_name)
    @words = File.readlines(dictionary_name + ".txt")
    @words.each { |word| word.strip! }
  end
end
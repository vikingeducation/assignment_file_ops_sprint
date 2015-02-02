class DictionaryLoader
  attr_reader :words
  def initialize(dictionary_name)
    @words = File.readlines(dictionary_name + ".txt")
    @words.each { |word| word.strip! }
  end
end

#Create a class (e.g. DictionaryLoader) whose function is to read in the specified dictionary file. Remember that classes don't need to be big.
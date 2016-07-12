class DictionaryLoader
  attr_reader :words

  def initialize
    @words = File.read("5desk.txt")
  end

end

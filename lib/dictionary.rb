
class Dictionary
  attr_reader :words
  def initialize(path)
    @words = DictionaryLoader.new(path).dictionary
  end

  # def dictionary
  #   @dictionary
  # end
end

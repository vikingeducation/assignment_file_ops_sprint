
class Dictionary
  # attr_reader :dictionary
  def initialize(path)
    @dictionary = DictionaryLoader.new(path)
  end 

  def dictionary
    @dictionary
  end
end

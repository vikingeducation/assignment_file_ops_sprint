
class Dictionary
  def initialize(path)
    @dictionary = DictionaryLoader.new(path)
  end 
end

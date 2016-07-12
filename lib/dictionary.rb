class Dictionary
  attr_reader :words

  def initialize
    @words = DictionaryLoader.new.load
  end

end

class Dictionary
  attr_reader :words

  def initialize(file)
    @words = DictionaryLoader.new.load(file)
  end

end

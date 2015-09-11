class DictionaryLoader
  attr_accessor :file

  def load(path)
    @file = File.open(path)
  end


end
class DictionaryLoader


  attr_reader :words

  def initialize path
    @words = load(path)
  end

  def load(path)
    file = File.open(path, 'r')
    text = file.read.scan(/\b\w+\b/)
    file.close
    text
  end


end

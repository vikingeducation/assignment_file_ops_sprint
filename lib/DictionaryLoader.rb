class DictionaryLoader
  def initialize
  end
  def load_file(path)
    file = File.open(path, 'r')
    text = file.read.scan(/\b\w+\b/)
    file.close
    text
  end
end

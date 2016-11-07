require_relative 'Dictionary'

class DictionaryLoader

  def self.file_load(path)
    file = File.open(path, 'r')
    text = file.read.scan(/\b\w+\b/)
    file.close
    text
  end

  def self.createDictionaryFrom(path)
    Dictionary.new(DictionaryLoader.file_load(path))
  end

end

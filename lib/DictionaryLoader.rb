#DictionaryLoader

class DictionaryLoader
  def load(filepath)
    words = File.readlines(filepath).map { |item| item.strip }
    Dictionary.new(words)
  end
end

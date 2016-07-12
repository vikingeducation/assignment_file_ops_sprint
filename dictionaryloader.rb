
class DictionaryLoader
  def self.load(dict_location)
    File.read(dict_location)
  end
end

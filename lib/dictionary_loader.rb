class DictionaryLoader

  def self.load(dictionary_path)
    dictionary = File.readlines(dictionary_path)
    Dictionary.new(dictionary)
  end

end
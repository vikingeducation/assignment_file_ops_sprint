class DictionaryLoader

  def self.load(dictionary_path)
    dictionary = File.open(dictionary_path, 'r')
    Dictionary.new(dictionary)
  end

end
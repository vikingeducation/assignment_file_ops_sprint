class DictionaryLoader
  def load(filename)
    raise("That file does not exist.") unless File.exist?(filename)
  end
end
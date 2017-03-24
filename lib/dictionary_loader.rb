class DictionaryLoader
  def load(filename)
    raise("That file does not exist.") unless File.exist?(filename)

    words = File.readlines(filename)
    words.map! { |word| word.strip }
    Dictionary.new(words)
  end
end
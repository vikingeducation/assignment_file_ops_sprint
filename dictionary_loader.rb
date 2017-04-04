class DictionaryLoader
  def load(fname)
    words = []
    File.readlines(fname).map { |word| words << word.strip }
    Dictionary.new(words)
  end
end

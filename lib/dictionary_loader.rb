class DictionaryLoader
  def self.load_file(path)
    file = File.readlines(path).map(&:chomp)
    return file
  end
end

class DictionaryNotFound < StandardError
end

class DictionaryLoader
  # takes a path to file
  # Edge case: file not found raise DictionaryNotFound error

  # read the file and return a Dictionary instance

  def initialize(path)
    raise DictionaryNotFound, 'dictionary not found in the path provided' unless File.exist?(path)
    @path = path

  end

  def load
    content = File.readlines(@path).map(&:chomp)
    Directory.new(content)
  end
end

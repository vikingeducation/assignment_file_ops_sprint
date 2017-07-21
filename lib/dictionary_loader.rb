class DictionaryLoader
  def initialize(path)
    @path = path
  end

  def load
    content = File.readlines(@path).map(&:chomp)
    Directory.new(content)
  end
end

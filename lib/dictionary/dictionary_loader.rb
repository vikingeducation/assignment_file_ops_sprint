class DictionaryLoader
  def self.load(path)
    File.open(path, 'r') do |file|
      Dictionary.new(file.readlines)
    end
  end
end

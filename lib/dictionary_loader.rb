class DictionaryLoader

  def self.load(file)
    File.readlines(file).map { |line| line.strip }
  end

end


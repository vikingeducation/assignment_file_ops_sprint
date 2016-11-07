class DictionaryLoader

  def self.load(file_path)
    raise ArgumentError unless file_path.is_a?(String)
  end
end
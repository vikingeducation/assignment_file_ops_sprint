class DictionaryLoader

  def load(file)
    words = []
    File.readlines(file).each do |line|
      words << line.strip
    end
    words
  end

end
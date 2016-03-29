class DictionaryLoader

  def self.load path
    dictionary = []
    File.readlines(path).each do |line|
      dictionary.push line.upcase.strip
    end
    dictionary
  end

end
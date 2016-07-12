class DictionaryLoader

  attr_reader :dictionary
  def initialize(path)
    @dictionary = File.readlines(path).map(&:strip)
  end

end





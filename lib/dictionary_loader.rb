class DictionaryLoader
  # Dir.pwd
  # __dir
  attr_reader :dictionary
  def initialize(path)
    @dictionary = File.readlines("5desk.txt").map(&:strip)
  end
end

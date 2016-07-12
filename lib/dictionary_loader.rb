class DictionaryLoader
  # Dir.pwd
  def initialize(path)
    @dictionary = File.readlines("lib/5desk.txt").map(&:strip)
  end
end

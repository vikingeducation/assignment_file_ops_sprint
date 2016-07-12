class DictionaryLoader

  def initialize
    File.readlines("5desk.txt").map{|word| word.strip}
  end

end
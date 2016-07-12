class DictionaryLoader

  def initialize(name)
    File.readlines(name).map{ |word| word.strip }
  end

end

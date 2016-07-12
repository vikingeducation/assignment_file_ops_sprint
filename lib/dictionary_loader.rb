class DictionaryLoader

  def load
    File.readlines("lib/desk.txt").map{ |word| word.strip }
  end

end

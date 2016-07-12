class DictionaryLoader

  def load(file = "desk.txt")
    File.readlines("lib/#{file}").map{ |word| word.strip }
  end

end

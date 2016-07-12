class DictionaryLoader

  def load(file)
    File.readlines("lib/#{file}").map{ |word| word.strip }
  end

end

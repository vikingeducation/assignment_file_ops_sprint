class DictionaryLoader

  #perform loading and processing of dictionary file before returning as instance of a Dictionary
  def load(path)
    processed = []
    File.readlines(path).each do |line|
      processed << line.strip
    end
    processed
  end


end
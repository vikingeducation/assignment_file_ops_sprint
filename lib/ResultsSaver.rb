require "DictionarySearcher"
require "Dictionary"

class ResultsSaver

  def save(word_to_lookup, choice="exact", file_name = "results.txt")
    file = File.open(file_name, w)
    results = DictionarySearcher.new.search(Dictionary.new.words, word_to_lookup, choice)
    file.write(results)
    file.close
  end
  
end

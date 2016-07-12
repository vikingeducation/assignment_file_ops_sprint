require "DictionarySearcher"
require "Dictionary"

class ResultsSaver

  def save(word_to_lookup, file_name = "results.txt")
    file = File.open(file_name, w)
    results = DictionarySearcher.new.search(Dictionary.new.words, word_to_lookup)
    file.write(results)
    file.close
  end
end

require "DictionarySearcher"
require "Dictionary"

class ResultsSaver

  def save_to(new_file)
    file = File.open(new_file, w)
    results = DictionarySearcher.new.search(Dictionary.new.words, "cat")
    file.write(results)
    file.close
  end

end

r = ResultsSaver.new
r.save_to("results.txt")
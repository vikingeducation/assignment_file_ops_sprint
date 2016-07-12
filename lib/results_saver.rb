class ResultsSaver

  def save(word_to_lookup, choice="exact", file_name = "results.txt")
    file = File.open(file_name, 'w')
    file.write(results.to_s)
    p results
    file.close
  end

end

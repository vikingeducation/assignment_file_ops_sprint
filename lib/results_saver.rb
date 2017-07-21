class ResultsSaver
  def self.save(results, path)
    File.write(path, results.join("\n"))
  end
end

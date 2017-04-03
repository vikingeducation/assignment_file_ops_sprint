class ResultsSaver
  def save(fpath, results)
    File.open(fpath, 'w') { |file| file.write results }
  end
end

class ResultsSaver
  def save_file(fname, results)
    File.open(fname, 'w') { |file| file.write results }
  end
end

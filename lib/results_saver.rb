class ResultsSaver
  def save_to_file(filename, results)
    File.open(filename, 'w') do |file|
      results.each { |result| file.write(result) }
    end
  end
end

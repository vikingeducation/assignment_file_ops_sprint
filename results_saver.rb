class ResultsSaver
  def initialize(results, file)
    @results = results
    @file = file
  end

  def save
    File.open(@file, 'w+') do |file|
      file.write(@results.join("\n"))
    end
  end
end

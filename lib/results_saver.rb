class ResultsSaver
  # attr_reader :results

  def initialize(results) 
    @results = results
  end

  def save(file_name = "results.txt") 
    file = File.open(file_name, 'w')
    # if file.readlines.length > 1
    file.write(@results)
    file.close
  end

end
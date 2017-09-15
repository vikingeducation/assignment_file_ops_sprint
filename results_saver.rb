# takes a batch of results and writes them to a file
class ResultsSaver
  def initialize(filename, matched_results)
    @filename = filename
    @matched_results = matched_results
  end

  def generate_file
    File.open(@filename,"w") do |file|
      file.write @matched_results
    end
  end

end
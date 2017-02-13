class ResultsSaver

  def initialize(filepath, results, search_term)
    @filepath = filepath
    @results = results
    @search_term = search_term
  end

  def save
    File.open(@filepath, "w") do |file|
      file.write("Your matched results for term '#{@search_term}' are: #{@results}")
    end
  end

end
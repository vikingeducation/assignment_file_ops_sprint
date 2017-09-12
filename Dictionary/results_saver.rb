class ResultsSaver
  def initialize(search_results)
    @search_results = search_results
  end

  def save_search_results(file_name)
    File.open(file_name, "w") do |file|
      @search_results.each { |word| file.write(word)}
    end
  end
end
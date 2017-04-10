# takes a batch of results and writes them to a file
require_relative 'dictionary_searcher'

class ResultsSaver

  def initialize(save_pathway, results_array)
    @pathway = save_pathway
    @results = results_array
  end


  def file_exists?
    if File.exists?(@pathway)
      return true
    else
      return false
    end
  end


  def save_file
    File.open(@pathway, "w") do |file|
      @results.each { |line| file.write("#{line}\n") }
    end
  end

end

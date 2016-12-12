require 'pry'

class ResultsSaver

  def initialize(path, results)
    @path = path
    @results = results
  end

  def file_exist?
    File.exist?(@path)
  end

  def save
    File.open(@path, "w") do |file|
      file.write(@results)
    end
  end



end
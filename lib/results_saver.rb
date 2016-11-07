class ResultsSaver

  def initialize(results)
    @results = results
  end

  def save()
    get_path
    write_file
  end

  def get_path
    puts "What file path should we write the results to?"
    @file_path = gets.chomp
    if file_exists?
      puts "That file exists. Overwrite? (y/n) 'q' quits"
      overwrite = gets.chomp.downcase
      get_path if overwrite == 'n'
    end
  end

  def file_exists?
    File.file?(@file_path)
  end

  def write_file
    file = File.open(@file_path, 'w')
    @results.each do |result|
      file << result
    end
    file.close
  end
end
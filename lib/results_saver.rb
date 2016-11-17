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
    path = gets.chomp
    @file_path = File.expand_path(File.dirname(__FILE__)) + "/../data/#{path}"
    check_for_overwrite
  end

  def check_for_overwrite
    if file_exists?
      puts "That file exists. Overwrite? (y/n) 'q' quits"
      overwrite = gets.chomp.downcase
      exit if overwrite == 'q'
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
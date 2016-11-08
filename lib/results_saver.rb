class ResultsSaver

  def initialize(results)
    @results = results
    @filepath = nil
    get_filepath
    write_file
  end

  def get_filepath
    puts "What filepath should we write results to?"
    proposed_path = gets.chomp
    if File.exist?(proposed_path)
      puts "That file exists, overwrite? y/n? 'q' quits."
      response = gets.chomp
      return unless response == 'y'
    end
    @filepath = proposed_path
  end

  def write_file
    File.open(@filepath, "w") do | file |
      file.write(@results)
    end
  end

  # def valid_input(response)
  #   %w(y n q).include?(response)
  # end
end

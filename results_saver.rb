class ResultsSaver

  def save results, file_path
    save_form = results.to_yaml
    File.open(file_path, 'w') do |file|
      file.write(save_form)
    end
    puts 'File saved'
    puts '*' * 20
  end

  def save_choice
    loop do
      puts "Do you want to save results? y/n? 'q' quits"
      save_decision = gets.chomp
      return 'q' if save_decision.downcase == 'q'
      return 'y' if save_decision.downcase == 'y'
      return 'n' if save_decision.downcase == 'n'
    end
  end

  def save_file_path
    puts "What filepath should we write results to?"
    gets.chomp
  end

  def file_existence file_path
    File.file? file_path
  end

  def overwrite_choice
    loop do
      puts "That file exists, overwrite? y/n? 'q' quits."
      save_decision = gets.chomp
      return 'q' if save_decision.downcase == 'q'
      return 'y' if save_decision.downcase == 'y'
      return 'n' if save_decision.downcase == 'n'
    end
  end

end

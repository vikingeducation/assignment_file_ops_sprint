class ResultsSaver

  def initialize(word, match_type, results)
    @word = word
    @match_type = match_type
    @results = results
  end

  def save_results(file)
    File.open(file, "w") do |results_file|
      results_file.write "Type of match: #{@match_type}\n"
      results_file.write "Word matched: #{@word}\n"
      results_file.write "Results:\n#{@results}"
    end
  end

  def save_file_input
    user_input = ""
    until user_input == "y" || user_input == "n"
      puts "Do you want to save results?"
      user_input = gets.chomp
    end

    if user_input == "y"
      filename = ""
      until filename.length > 0
        puts "Enter the name of the file to save results to."
       filename = gets.chomp
      end

      if File.file?(filename)
        input = ""
        until input == "y" || input == "n"
          puts "File exists, do you want to overwrite?"
          input = gets.chomp
        end
        if input == "y"
          save_results(filename)
        end
      else
        save_results(filename)
      end
      
    end
  end
end
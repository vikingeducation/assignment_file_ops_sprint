require 'yaml'
class ResultSaver
  def ask_user_save(matches)
    puts "Would you like to save your results? (y/n)"
    option = gets.chomp
    if option == "y"
      path = ask_path
      save(path, matches)
      puts "your file has been saved in #{path}"
    end
  end

  def ask_path
    puts "where would you like to save your results?"
    gets.chomp
  end

  def ask_overwrite
    puts "file exists... would you like to overwrite the file? (y/n)"
    gets.chomp
  end

  def save(path, match)
    option = ask_overwrite if File.exists?(path)
    if option == "y" || !File.exists?(path)
      mode = "w"
    elsif option == "n"
      mode = "a"
    else
      puts "please enter 'y' or 'n'" 
      ask_overwrite
    end
    File.open(path, mode) do |file|
      file.write match.to_yaml
    end
  end


end

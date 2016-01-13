

class DictionaryUI

  def user_file_path
    puts "Welcome to Dictionary."
    puts "Where is your dictionary? ('q' to quit)"
    input = gets.chomp
    if input == "q"
      puts "Okay, bye"
      exit
    else
      return input
    end
  end


  def run
    file_path = user_file_path


  end



end


d = DictionaryUI.new
d.run

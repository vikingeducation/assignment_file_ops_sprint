

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
    word_search = user_word
  end

  def user_word
    puts "How would you like to search the words."
    puts "Enter X for Exact matches"
    puts "Enter P for Partial matches"
    puts "Enter B for 'Begin With' matches"
    puts "Enter E for 'End with' matches"
    input = gets.chomp.upcase
  end

end


d = DictionaryUI.new
d.run

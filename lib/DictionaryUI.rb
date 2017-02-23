# DictionaryUI is the main class which handles the user interaction loop.

class DictionaryUI

  def initialize

  end

  def run
    loop do
      puts "Where is your dictionary? ('q' to quit)"
      file_path = gets.chomp

      if file_path != "q"
        puts "What kind of search? "
        puts "1. Exact matches"
        puts "2. Partial matches"
        puts "3. Begins With"
        puts "4. Ends With"
        search_method = gets.chomp
      end

      puts "Enter the search term"
      searh_term =  gets.chomp
      
      while  file_path != 'q'
    end
  end

  def prompt_user_to_save
    puts "Do you want to save results? y/n? 'q' quits."
    save_file = gets.chomp
    puts "What filepath should we write results to?"
    save_filepath = gets.chomp
      
      if file_path exists
        puts "That file exists, overwrite? y/n? 'q' quits."
      else
        # call save menthod
        puts "File successfully overwritten!"
      end
  end
end


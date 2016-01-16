

class DictionaryUI


  def ask_user_input

    file = ""
    unti file != ""
      print "Where is your dictionary? ('q' to quit) "
      file = gets.chomp

      if File.file?
         dict = File.readlines(file)
         @count = dict.size 

         puts "No of words is : @count"

      end
    end

  end


  def count_by_letter

  end

end  
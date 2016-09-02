class ResultsSaver

  def save(results)

    save_confirmed = false

    puts "Do you want to save the results? y/n?"
    choice = gets.chomp

    if choice == 'n'
      puts "Exiting the dictionary....."
    elsif choice == 'y'

      until save_confirmed
        puts "Enter a file name:"
        file_name = gets.chomp

        if File.exist?(file_name)
          puts "That file exists, overwrite? y/n?"
          overwrite = gets.chomp

          if overwrite == 'y'
            File.open(file_name, 'w') { |f| f.write(results) }
            save_confirmed = true
          else
            save_confirmed = false
          end

        else
          File.open(file_name, 'w') { |f| f.write(results) }
          save_confirmed = true
        end
      end
    end
  end

end
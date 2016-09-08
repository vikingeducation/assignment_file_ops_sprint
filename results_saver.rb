class ResultsSaver

  def save(results)
    loop do
      puts "# Do you want to save results? (y/n) \'q\' quits."
      save = gets.chomp
      break if save == 'q' || save == 'n'
      if save == 'y'
        puts "# What filepath should we write results to?"
        save_path = gets.chomp
        if File.exist?(save_path)
          puts "# That file exists, overwrite? (y/n) 'q' quits."
          overwrite = gets.chomp
          break if overwrite == 'q'
          if overwrite = 'y'
            File.open(save_path, 'w') {|f| f.write(results)}
            puts "# File successfully overwritten"
            break
          end
        else
          File.open(save_path, 'w') {|f| f.write(results)}
          puts "# File successfully written"
          break
        end
      end
    end
  end

end
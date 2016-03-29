class ResultsSaver
  def self.save_search result
    puts "Do you want to save result y/n? 'q' to quit"
    input = ask_save
    if input == "Y"
      puts "which file should we write to?"
      input_file = gets.chomp
      if File.exist?(input_file)
        #loop do
          puts "Do you want to overwrite? y/n"
          input = ask_save
         # return input if ["Y","N"].include?(input)
        #end
        if input == "Y"
          puts "overwrite"
          File.open(input_file, "w+") do |file|
            result.each do |word|
              file.write word + "\n"
            end
          end
        else
          File.open(input_file, "a+") do |file|
            file.write "\n"
            result.each do |word|
              file.write word + "\n"
            end
          end
        end
      else
        File.open(input_file, "w+") do |file|
          result.each do |word|
            file.write word + "\n"
          end
        end
      end
    end
  end

  def self.ask_save
    loop do
      input = gets.chomp.upcase
      exit if input == "Q"
      return input if ["Y","N"].include?(input)
    end
  end
end
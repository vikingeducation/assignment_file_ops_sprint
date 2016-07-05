require 'yaml'
class ResultsSaver
  def self.save(result)
    puts "What filepath should we write results to?"
    file_name = gets.chomp
    dump = result.to_yaml
    if File.exist?(file_name)
      puts "File #{file_name} alredy exists, do you want to overwrite?"
      ip = nil
      loop do
        ip = gets.chomp
        exit if ip == 'q'
        break if ['y', 'n'].include?(ip)
        puts "Please enter a valid input. y/n?"
      end
      exit if ip == 'n'
    end
    File.open(file_name, "w") do |file|
      file.write dump
    end
    puts "File successfully written!"
    p File.read(file_name)
  end
end
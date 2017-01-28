# takes a batch of results and writes them to a file
class ResultsSaver

  def run(results)
    prompt_save() && save_results(results)
  end

  def prompt_save
    puts ""
    puts "Do you want save the results? [y/n] 'q' quits."
    parse_user_options(gets.strip)
  end

  def save_results(results)
    puts "What filepath should we write the results to?"
    path = gets.strip
    if File.exist?(path)
      puts "That file exists, overwrite? [y/n] 'q' quits"
      if parse_user_options(gets.strip)
        write_file(path, results)
        return puts "File successfully overwritten"
      end
    end
    write_file(path, results)
    puts "File successfully written"
  end

  def write_file(path, results)
    File.open(path, "w") do |file|
      results.each{ |item| file.write("#{item}\n") }
    end
  end

  def parse_user_options(input)
    case input
    when "q"
      false
    when "n"
      false
    when "y"
      true
    end
  end

end

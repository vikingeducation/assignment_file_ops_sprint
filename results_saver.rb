class ResultsSaver

  def initialize(search_results)
    @search_results = search_results
  end

  def results_saver
    if get_save_or_quit == "y"
      loop do
        path = ask_file_path_to_save
        if !File.file?(path)
          File.write(path, search_results)
          break
        end
        prompt_question = prompt_overwriting
        if prompt_question == "y"
          file.write search_results
          print "File successfully overwritten!"
          break
        elsif prompt_question == "n"
        elsif prompt_question == "q"
          break
        end
      end
    end
    true
  end

  private

  def get_save_or_quit
    puts "Do you want to save results? y/n? 'q' quits."
    gets.chomp
  end

  def ask_file_path_to_save
    puts "What filepath should we write results to?"
    gets.chomp
  end

  def prompt_overwriting
    puts "That file exists, overwrite? y/n? 'q' quits."
    gets.chomp
  end

end
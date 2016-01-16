# ResultsSaver takes a batch of results and writes them to a file.

class ResultSaver
  def save_results(search_word, search_type, matches, file_name, write_mode)
    if search_type == '1'
      search = "Exact Matches"
    elsif search_type == '2'
      search = "Partial Matches"
    elsif search_type == '3'
      search = "Begins With Matches"
    else
      search = "Ends With Matches"
    end
    File.open(file_name,write_mode) do |file|
      file.write "Search Word: #{search_word}"
      file.write "\n"
      file.write "Search Type: #{search}"
      file.write "\n"
      file.write "Matches:"
      file.write "\n"
      matches.each do |matched_words|
        file.write "#{matched_words}"
        file.write "\n"
      end
    end
    confirm_save(file_name)
  end

  def confirm_save(file_name)
    puts File.read("#{file_name}")
  end
end
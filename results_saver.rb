class ResultsSaver

  def save_results(matches, file_path)
    File.open(file_path, "w+") do |file|
      file.write matches
    end
  end


end
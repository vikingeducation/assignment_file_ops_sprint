class ResultsSaver
  def self.write_to_file(word_arr, file_name=nil)
    file_name ||= "results.txt"
    File.open(file_name, "a") do |file|
      word_arr.each do |word|
        file.write word.upcase
        file.write "\n"
      end
    end
  end
end

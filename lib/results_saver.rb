# saves results to disk
class ResultsSaver
  def self.save(results, filename)
    save_string = ""
    results.each do |word|
      save_string << word + "\n"
    end

    File.open(filename, "w") do |file|
      file.write save_string
    end

    true
  end
end
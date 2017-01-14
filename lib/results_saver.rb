# takes a batch of results and writes them to a file

class ResultsSaver
  def self.save(path, results)
    File.open(path, 'w') do |file|
      results.each do |word|
        file.write "#{word}\n"
      end
    end
  end
end

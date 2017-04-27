class ResultsSaver
  def self.save(file, results)
    File.open(file, 'w') do |f|
      f.write results
    end
  end
end

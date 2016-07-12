require 'json'

class ResultsSaver
  def archive(file_name, *data)
    File.open(file_name, "w+") do |file|
      data.each {|entry| file.write "#{entry.to_json}" }
    end
  end
end

# c = ResultsSaver.new.save("test.txt", "(1..10).to_a", 10, "threeeve")

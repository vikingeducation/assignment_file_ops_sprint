require 'yaml'

class ResultsSaver
  @@dump = ""

  def self.save
    dict.results["#{dict.input_num}, #{dict.input_query}"] = dict.matches
  end

  def self.export(string, mode)
    @@dump = dict.results.to yaml
    File.open(string, mode) do |file|
      file.write @@dump
    end  
  end

end

require 'yaml'

class ResultsSaver
  @@dump = ""

  def self.save(num, query, matches)
    @@dump = {"#{num}, #{query}" => matches}.to_yaml

  end

  def self.export(string, mode)
    File.open(string, mode) do |file|
      file.write @@dump
    end
  end

end

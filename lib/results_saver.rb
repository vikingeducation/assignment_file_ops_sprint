#results_saver
require 'yaml'

class ResultsSaver

  def self.save(text, file_name, mode)
    File.open(file_name, mode) do |file|
      if text.is_a?(String)
        file.write(text << "\n")
      else
        file.write(text.to_yaml << "\n")
      end
    end
  end
end
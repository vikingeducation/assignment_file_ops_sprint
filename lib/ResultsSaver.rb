#ResultsSaver
require 'yaml'

class ResultsSaver

  def handle_saving(filepath, results)
    yaml_results=YAML::dump(results)
    File.open(filepath,"w") do |file|
      file.write yaml_results
    end

  end
end

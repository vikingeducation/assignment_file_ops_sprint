
# takes a batch of results and writes them to a file.

 class ResultsSaver
   def initialize(results, where, overwrite)
     @results = results
     @where = where
     @overwrite = overwrite
     write
   end

   def write
     @overwrite ? mode = "w" : mode = "a"
     Dir.chdir(File.dirname(@where)) do
       File.open(File.basename(@where), mode) { |file| file.write(@results) }
     end
     target_exist
   end

   def target_exist
     if File.file?(@where)
       write_check
     else
       puts "\n Unable to create file to save results to"
     end
   end

   def write_check
     if File.open(@where).each.any? { |line| line.include?("#{@results}") }
       puts "\n Results saved successfully"
     else
       puts "\n Failed to save results"
     end
   end
 end

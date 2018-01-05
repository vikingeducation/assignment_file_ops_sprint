
# takes a batch of results and writes them to a file.

 class ResultsSaver
   def initialize(results, where, overwrite)
     @results = results
     @where = where
     @overwrite = overwrite
     write
   end

   def write
     if Dir.exist?(File.dirname(@where)) && !File.file?(@where)
       Dir.chdir(File.dirname(@where)) do
# TODO fix problem with processing file names/need to create them if they're not specified
         File.open("#{File.basename(@where)}", "a") { |file| file.write(@results) }
       end
     else
       @overwrite ? mode = "w" : mode = "a"
       Dir.chdir(File.dirname(@where)) do
         File.open("#{File.basename(@where)}", mode) { |file| file.write(@results) }
       end
     end
     target_exist
   end

# TODO move this check to d_ui as this is going outside of this classes purpose
   def target_exist
     if File.file?(@where)
       write_check(@where)
     elsif Dir.exist?(@where)
       write_check("#{@where}/results.txt")
     else
       puts "\n Unable to create file to save results to"
     end
   end

   def write_check(file_path)
     if File.open(file_path).each.any? { |line| line.include?("#{@results}") }
       puts "\n Results saved successfully"
     else
       puts "\n Failed to save results"
     end
   end

 end

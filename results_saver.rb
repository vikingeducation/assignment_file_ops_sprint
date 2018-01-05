
# takes a batch of results and writes them to a file.

# /home/brennan/Documents/Viking/Ruby/dictionary/example
# /home/brennan/Documents/Viking/Ruby/dictionary/example/results.txt

require "pry"

 class ResultsSaver
   def initialize(results, where, overwrite)
     @results = results
     @where = where
     @overwrite = overwrite
     write
   end



   def write
     @overwrite ? mode = "w" : mode = "a"

     if @where[-1] == "/"
       filename = "results.txt"
       filepath = @where
     else
       filename = "#{File.basename(@where)}"
       filepath = File.dirname(@where)
     end

binding.pry
       Dir.chdir(filepath) do
         File.open(filename, mode) { |file| file.write(@results) }
       end

     target_exist
   end



# TODO move this check to d_ui as this is going outside of this classes purpose
   def target_exist
     if File.file?(@where)
binding.pry
       write_check(@where)
     elsif Dir.exist?(@where)
binding.pry
       write_check("#{@where}results.txt")
     else
binding.pry
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


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
   end
 end

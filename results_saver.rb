
# takes a batch of results and writes them to a file.

 class ResultsSaver
   def initialize(results, where, how = nil)
     @results = results
     @where = where
     @how = how
     write
   end

   def write
     if Dir.exist?(@where)
       Dir.chdir(@where) do
# TODO check and handle if the necessary permissions are present to create a file
         File.open("results2.txt", "w") { |file| file.write(@results) }
       end
     else
       Dir.chdir(File.dirname(@where)) do
# TODO check and handle if the file is write-able or not
         @how == "replace" ? mode = "w" : mode = "a"
         File.open("#{File.basename(@where)}", mode) { |file| file.write(@results) }
       end
     end

   end

 end

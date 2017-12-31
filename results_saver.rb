
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
         File.new(results2.txt, "w") { |words| words.write(@results)}
       end
     else # if @where includes a file at the end of the path (or just the file)
       Dir.chdir(# regexp on @where) do
        @how == replace ? # overwrite @where with @results : append @results to @where
       end
     end

   end

 end


# takes a batch of results and writes them to a file.

 class ResultsSaver
   def initialize(results, where, how)
     @results = results
     @where = where
     @how = how
     write
   end

   def write

     if Dir.exist?(@where) # if @where is a directory
       # create file
       # then @how = add, so append @results to created file
     else # if @where includes a file at the end of the path (or just the file)
       # if @how = add, append @results to @where
       # if @how = replace, overwrite @where with @results
     end

   end

 end

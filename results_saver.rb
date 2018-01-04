
# takes a batch of results and writes them to a file.

 class ResultsSaver
   def initialize(results, where, overwrite)
     @results = results
     @where = where
     @overwrite = overwrite
     write
   end

=begin
 figure out a way for this part to move to the root of the file system but not lose the current path

 |Dir.home()| changes working directory to current user home (/home/'username'/)

 while |Dir.pwd| returns current working directory

 system "cd 'path'" old school method, probably bad practice
=end
   def write
     if Dir.exist?(@where)
       Dir.chdir(@where) do
         File.open("results.txt", "a") { |file| file.write(@results) }
       end
     else
       @overwrite ? mode = "w" : mode = "a"
       Dir.chdir(File.dirname(@where)) do
         File.open("#{File.basename(@where)}", mode) { |file| file.write(@results) }
       end
     end

   end

 end


# takes a batch of results and writes them to a file.

require "pry"

# needs major rewrite in general but especially because how is now a true/false value indicating whether to overwrite or not
 class ResultsSaver
   def initialize(results, where, how)
     @results = results
     @where = where
     @how = how
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
binding.pry
       Dir.chdir(@where) do

# TODO check and handle if the necessary permissions are present to create a file
         File.open("results1.txt", "w") { |file| file.write(@results) }
       end
     else
# TODO make it handle directory structures that don't exist by creating necessary folders see |mkdir|
binding.pry
       Dir.chdir(File.dirname(@where)) do
# TODO check and handle if the file is write-able or not
         @how == "replace" ? mode = "w" : mode = "a"
         File.open("#{File.basename(@where)}", mode) { |file| file.write(@results) }
       end
     end

   end

 end

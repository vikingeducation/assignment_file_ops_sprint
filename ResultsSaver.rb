
class ResultsSaver

    attr_accessor :out_file_name, :overwrite

    def initialize results, filename, overwrite
        @results = results
        @filename = filename
        @overwrite = overwrite
    end
       
        def write_results_to_file
            if overwrite
                out = File.open(@filename, "w")
                @results.each do | word |
                out.write(word + "\n")
            end
            else
                @results.each do | word |
                    puts word
                end
            end
        end
    
end


r = ResultsSaver.new( ["check", "this", "out"] )
r.overwrite = false
r.out_file_name = "someoutput.txt"
r.write_results_to_file


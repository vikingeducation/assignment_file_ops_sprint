
class ResultsSaver

    attr_accessor :out_file_name, :overwrite

    def initialize results
        @results = results
    end

    def write_results_to_file
        if overwrite
            out = File.open(out_file_name, "w")
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


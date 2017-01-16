# Dictionary Search

# assignment_file_ops_sprint

module File_operations
  class ResultsSaver

    def write_to_file(search_results)
      puts "Search results = #{search_results}"
      File.open("Results.txt", "w") do |file|
        file.write search_results
      end
    end

  end
end



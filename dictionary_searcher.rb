# Dictionary Search

# assignment_file_ops_sprint

module File_operations
  class DictionarySearcher

    def initialize(results_saver)
      @results_saver = results_saver
    end

    def provide_dictionary(dictionary_array)
      @dictionary_array = dictionary_array
    end

    def perform_analysis(regex_phrase)
      matches = []
      @dictionary_array.each do |word|
        if word.scan(regex_phrase) != []
          matches << word.scan(regex_phrase)
        end
      end
      @results_saver.write_to_file(matches)
    end

  end
end


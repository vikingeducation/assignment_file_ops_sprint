# Dictionary Search

# assignment_file_ops_sprint

module File_operations
  class Dictionary

    def initialize(dictionary_searcher)
      @dictionary_searcher = dictionary_searcher
    end

    def wrap_dictionary(dictionary_array)
      @dictionary_searcher.provide_dictionary(dictionary_array)
    end

  end
end


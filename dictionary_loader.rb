# Dictionary Search

# assignment_file_ops_sprint

module File_operations
  class DictionaryLoader

    attr_reader

    def initialize(dictionary)
      @dictionary = dictionary
    end

    def load_dictionary
      dictionary_array = []
      dictionary_lines = File.readlines("5desk.txt")
      dictionary_lines.each do |line|
        dictionary_array << line.strip
      end
      @dictionary.wrap_dictionary(dictionary_array)
    end

  end
end



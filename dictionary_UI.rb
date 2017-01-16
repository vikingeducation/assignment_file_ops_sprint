# Dictionary Search

# assignment_file_ops_sprint

module File_operations
  class DictionaryUI

    def initialize
      @results_saver = ResultsSaver.new
      @dictionary_searcher = DictionarySearcher.new(@results_saver)
      @dictionary = Dictionary.new(@dictionary_searcher)
      @dictionary_loader = DictionaryLoader.new(@dictionary)
      @dictionary_loader.load_dictionary
      puts "Dictionary has been loaded."
    end

    def search_regex
      loop do
        print "Enter regex expression you are searching with: "
        regex_phrase = gets.strip 
        puts "regex_phrase = #{regex_phrase}"
        @dictionary_searcher.perform_analysis(regex_phrase)
        return unless another_search?
      end
    end

    def another_search?
      print "Another search (Y or N)? "
      until %w(Y N).include? (answer = gets.chomp)
        print "Incorrect answer - try again: "
      end
      return true if answer == "Y"
      false
    end

  end
end


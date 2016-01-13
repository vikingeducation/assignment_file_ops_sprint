
require "highline"

attr_accessor 

class DictionaryUI

    def initialize 
      @CLI = HighLine.new
      @loader 
      @dictionary
      @searcher
      @saver
    end

    def run
      get_dictionary_location
      @dictionary = @loader(load_dictionary)
      get_word
      
      @searcher = DictionarySearcher.new(@dictionary)
      results = @searcher.search(word,get_search_type)
      filename, overwrite = get_filename
      @saver = ResultsSaver.new(results)

      
      #overwriteror not
      #save results
      
      

    end

    def get_filename
      input_file = @CLI.ask "Please enter a file name."
      input_overwrite = @CLI.ask "Would you like to overwrite the existing file?"
      return input_file, input_overwrite
    end
   

    def get_search_type
      input = @CLI.ask "Please enter a search type (1-4)."
    end

    def get_word
      input = @CLI.ask "Please enter a valid word."
      case input 
    end

    def dictionary_location
      input = @CLI.ask "Please enter the dictionary location."
      input.downcase
       @loader= DictionaryLoader.new(input)

    end
       
      
    
    end
end





  
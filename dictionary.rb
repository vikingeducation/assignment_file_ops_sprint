
require_relative "dictionary_loader"
require_relative "dictionary_searcher"


class Dictionary

  def initialize()
   
    @file_name = nil
    @dict = Array.new

  end

  def ask_and_load_dictionary_file
    input = ""

    until input.length > 0
      print "Enter the dictionary file name to upload: "
      input = gets.chomp
    end
    @file_name = input  
    puts "We will load the dictionary file #{@file_name}"

    if @dict = ::DictionaryLoader.load(@file_name)
      puts "File @{file_name} loaded successfully!"
      p @dict
      true
    else
      puts "Uable to load your dictionary file @{file_name}!"
      false
    end

  end

  def ask_for_word_to_search
    word = ""

    until word.length > 0
      print "Enter the word to search: "
      word = gets.chomp
    end
    word

  end

  def ask_search_type
    search_type = ""
    
    until ["P","p","e","E","B","b","x","X"].include?(search_type)
      print "Enter search type - [P]artial, e[X]act, [B]egins with, [E]nds with:"
      search_type = gets.chomp
    end

    search_type

  end

  def dictionary_reader

    puts "\n\n"
    if ask_and_load_dictionary_file
      
      loop do 
  
        puts "\n\n"
        word = ask_for_word_to_search
        search_type = ask_search_type
     
        ::DictionarySearcher.dictionary_search(search_type,word,@dict) 

      end

    end
  end

end 

d = Dictionary.new
d.dictionary_reader


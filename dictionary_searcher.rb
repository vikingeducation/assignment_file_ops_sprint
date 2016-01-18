require_relative 'results_saver.rb'

class DictionarySearcher

  def initialize(dict)
    @dict = dict
    @found_array = []
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

  def dictionary_search(search_type,search_word,dict)
    
    case search_type.upcase
    
    when "X"
      puts "================================================================="
      dict.include?(search_word) ? (puts "Found #{search_word}") : \
                                   (puts "No exact match found for #{search_word}")
      puts "================================================================="                                   
    when "P"

      regex = search_word
      dict.each_with_index do |item|
        @found_array << item if matchStr = item.match(/#{regex}/)
      end  
      if @found_array.length > 0
          puts "================================================================="
          p @found_array
          puts "\nFound #{@found_array.length} words matching pattern #{search_word}"
          puts "================================================================="
      end  


    when "B"
      
      regex = search_word
      dict.each_with_index do |item|
        @found_array << item if matchStr = item.match(/^#{regex}/)
      end  
      if @found_array.length > 0
          puts "================================================================="
          p @found_array
          puts "\nFound #{@found_array.length} words starting with pattern #{search_word}"
          puts "=================================================================" 
      end

    else

      regex = search_word
      dict.each_with_index do |item|
        @found_array << item if matchStr = item.match(/#{regex}$/)
      end  
      if @found_array.length > 0
          puts "================================================================="
          p @found_array
          puts "\nFound #{@found_array.length} words ending with pattern #{search_word}"
          puts "=================================================================" 
      end

    end  
      
  end

  def run

    puts "\n\n"
      
    loop do 

      puts "\n\n"
      word = ask_for_word_to_search
      search_type = ask_search_type
   
      dictionary_search(search_type,word,@dict) 
      results = ResultsSaver.new(word, search_type, @found_array)
      results.save_file_input
    end

  end
  
end
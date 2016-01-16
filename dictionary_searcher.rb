class DictionarySearcher


  def self.dictionary_search(search_type,search_word,dict)
    
    case search_type.upcase
    
    when "X"
      puts "================================================================="
      dict.include?(search_word) ? (puts "Found #{search_word}") : \
                                   (puts "No exact match found for #{search_word}")
      puts "================================================================="                                   
    when "P"

      regex = search_word
      found_array = []
      dict.each_with_index do |item|
        found_array << item if matchStr = item.match(/#{regex}/)
      end  
      if found_array.length > 0
          puts "================================================================="
          p found_array
          puts "\nFound #{found_array.length} words matching pattern #{search_word}"
          puts "================================================================="
      end  


    when "B"
      
      regex = search_word
      found_array = []
      dict.each_with_index do |item|
        found_array << item if matchStr = item.match(/^#{regex}/)
      end  
      if found_array.length > 0
          puts "================================================================="
          p found_array
          puts "\nFound #{found_array.length} words starting with pattern #{search_word}"
          puts "=================================================================" 
      end

    else

      regex = search_word
      found_array = []
      dict.each_with_index do |item|
        found_array << item if matchStr = item.match(/#{regex}$/)
      end  
      if found_array.length > 0
          puts "================================================================="
          p found_array
          puts "\nFound #{found_array.length} words ending with pattern #{search_word}"
          puts "=================================================================" 
      end

    end  
      
  end
  
end  

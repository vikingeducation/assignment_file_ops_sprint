class DictionarySearcher

<<<<<<< HEAD
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def exact_match

  end

  def partial_match

  end

  def begins_with

  end

  def ends_with

  end
end
=======

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
>>>>>>> de8a6f774ce0523dd34e180f903ab43dfc5aef2e

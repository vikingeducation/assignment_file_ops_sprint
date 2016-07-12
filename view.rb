

class View

  def self.where_dict
    puts "Where is your dictionary?"
  end

  def self.load_success(quick_stat_hash)
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{quick_stat_hash[0]} words."
    puts "Word frequency by starting letter:"
    quick_stat_hash[1].each_pair do |letter, number|
      puts "#{letter}: #{number}"
    end
  end

  def self.search_num
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends with"
    puts "q: quit"
  end

  def self.search_query
    puts "Enter the search term"
  end

  def self.save
    puts "Do you want to save the results? (y/n) 'q' quits."
  end

  def self.filepath
    puts "What filepath should we write results to?"
  end

  def self.overwrite
    puts "If that file exists, do you want to overwrite? y/n? 'q' quits."
  end

  def self.written
    puts "Your results have been added to the file!"
  end


end

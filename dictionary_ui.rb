class DictionaryUI
  attr_reader :location

  def run
    puts "Where is your dictionary? ('q' to quit)"
    @location = gets.chomp
    exit if location == "q"
    @location
  end


  def get_search_type
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Starts with"
    puts "4: Ends with"
    type = get.chomp
    puts "Enter the search term"
    search_term = gets.chomp
    [type, search_term]

  end

end
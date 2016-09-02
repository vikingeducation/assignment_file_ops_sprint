class DictionarySearcher

#----------

  def search_type

    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"

    gets.chomp.to_i

  end

#----------

  def perform_search(dictionary)

    matches = []
    type = search_type

    puts "Enter the search term:"
    search_term = gets.chomp

    case type
    when 1
      File.readlines(dictionary).each do |e|
        matches << e.chomp if e.downcase.chomp == search_term
      end

    when 2
      File.readlines(dictionary).each do |e|
        matches << e.chomp if e.downcase.include?(search_term)
      end

    when 3
      File.readlines(dictionary).each do |e|
        matches << e.chomp if e.downcase.start_with?(search_term)
      end

    when 4
      File.readlines(dictionary).each do |e|
        matches << e.chomp if e.downcase.chomp.end_with?(search_term)
      end

    else
      puts "Invalid choice."
    end

    display_matches(matches)
    matches
  end

#----------

  def display_matches(matches)

    puts "Found #{matches.length} matches:"

    matches.each do |e|
      puts e
    end

  end

#----------

end
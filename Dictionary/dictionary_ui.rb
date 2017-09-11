require_relative 'dictionary.rb'
require_relative 'dictionary_loader.rb'
require_relative 'dictionary_searcher.rb'

class DictionaryUI
  def initialize
    puts "Where is your dictionary"
    @location = gets.strip
    @dictionary = DictionaryLoader.new
    @stats = Dictionary.new
    @search = DictionarySearcher.new(@dictionary.load_dictionary(@location))
  end

  def search_type_and_term
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
    
    @type = gets.chomp.to_i

    puts "Enter the search term:"

    @term = gets.chomp
  end

  def conduct_search
    puts @term
    puts @type
    if @type == 1
      @search.search_exact(@term)
    elsif @type == 2
      @search.search_partial(@term)
    elsif @type ==3
      @search.search_begins_with(@term)
    elsif @type == 4
      @search.search_ends_with(@term)
    else
      "Invalid Entry"
    end
  end


  def go 
    @stats.compute_dictionary_stats(@dictionary.load_dictionary(@location))
    @stats.display_dictionary_stats
    search_type_and_term
    puts conduct_search
  end
end

a = DictionaryUI.new
a.go
require_relative 'dictionary_loader.rb'
require_relative 'dictionary.rb'
require_relative 'dictionary_searcher.rb'
require_relative 'results_saver.rb'

class DictionaryUI

  def initialize
    @loader = DictionaryLoader.new
    @searcher = DictionarySearcher.new
    @saver = ResultsSaver.new
  end

  def run
    greet
    @loader.load(@location)
    search
    results = @searcher.search(@search_type, @search_term, @location)
    @saver.save(results)
  end

  def greet
    loop do
      puts "# Where is your dictionary? (\'q\' to quit)"
      @location = gets.chomp
      break if @location == 'q'
      return @location
    end
  end

  def search
    puts "# What kind of search?"
    puts "# 1: Exact"
    puts "# 2: Partial"
    puts "# 3: Begins with"
    puts "# 4: Ends with"
    @search_type = gets.chomp.to_i
    puts "# Enter the search term"
    @search_term = gets.chomp.to_s
  end

end

d = DictionaryUI.new
d.run
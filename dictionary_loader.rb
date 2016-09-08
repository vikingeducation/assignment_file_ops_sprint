require_relative 'dictionary.rb'

class DictionaryLoader

  def initialize
    @dictionary = Dictionary.new
  end

  def load(location)
    if File.exist?(location)
      puts "# Dictionary successfully loaded"
      @dictionary.display_stats(location)
      return File.open(location, 'r')
    else
      puts "# File not found."
    end
  end
end
require_relative 'dictionary'
require_relative 'dictionaryloader'
# Handles user interaction
class DictionaryUI
  def initialize
    @dict_file = ''
    @dict = Dictionary
  end

  def run
    until @dict.is_a?(Dictionary)
      prompt_file_source
      @dict = DictionaryLoader.new(@dict_file).load
    end
    puts 'Dictionary successfully loaded'
    @dict.stats
    puts "Random word of the day: #{@dict.random_word}"
  end

  private

  def prompt_file_source
    puts "Where is your dictionary? ('q' to quit)"
    @dict_file = gets.strip
    exit if @dict_file.upcase == 'Q'
  end
end

d = DictionaryUI.new
d.run

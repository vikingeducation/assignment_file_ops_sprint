require_relative "../lib/dictionaryloader"
require_relative "../lib/dictionarysearcher"

class DictionaryUI
  include DictionarySearcher

  def initialize
    @dict = DictionaryLoader.new
  end

  def run
  	puts "Welcome"
    stats(@dict.dictionary)
    loop do
      puts "Type \"q\" to exit"
    	puts "Please enter a word: "
    	word = gets.chomp

      search(word)
      break if word == "q"
    end
  end

end

d = DictionaryUI.new
d.run

require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'dictionary_ui'

class Dictionary
  attr_reader :words, :searcher, :ui, :writer
  def initialize(dict = "dictionary.txt")
    @words = DictionaryLoader.load(dict)
    @searcher = DictionarySearcher.new(words)
    @ui = DictionaryUI.new
    @writer = ResultsSaver.new
  end

  def logic_loop
    ui.welcome
    loop do
      ui.instructions
      input = ui.listen
      break if quit?(input)
      output = select_task(input)
      save_to_file(output) if save?(ui.save_results(output))
    end
  end

  def quit?(input)
    return true if input == "q!"
    false
  end

  def select_task(input)
    return searcher.starts_with(input[1..-1]) if input[0] == "@"
    return searcher.ends_with(input[1..-1]) if input[0] == "$"
    searcher.find(input) 
  end

  def save?(input)
    input == "y"
  end

  def save_to_file(results)
    writer.save(results)
  end
end 

Dictionary.new("dict_simple.txt").logic_loop
require_relative 'dictionary'
require_relative 'dictionary_loader'

class DictionaryUI
  attr_reader :path
  def initialize(path = 'lib/5desk.txt')
    @path = path
    @dict = []
  end

  def run
    get_dictionary
  end

  def get_dictionary
    loop do
      prompt_user
      get_input
      new_dict = Dictionary.new(@path)
      @dict = new_dict.words
      p @dict[0..10]
      break unless @dict == []
    end
  end

  def prompt_user
    puts "Where is your dictionary? ('q' to quit)"
  end

  def get_input
    input = gets.strip
    exit if input == 'q'
    @path=File.join(__dir__, input)
  end
end

d = DictionaryUI.new
d.run

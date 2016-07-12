require_relative 'dictionary'
require_relative 'dictionary_loader'

class DictionaryUI
  attr_reader :path
  def initialize
    @path = ''
    @dict = []
  end

  def run
      get_dictionary

    p @dict[1..20]
  end

  def get_dictionary
    loop do
      prompt_user
      # get_input
      @dict = Dictionary.new(@path)
      break unless @dict = []
    end
  end

  def prompt_user
    puts "Where is your dictionary? ('q' to quit)"
  end

  def get_input
    input = gets.strip
    exit if input == 'q'
    @path=input
  end
end

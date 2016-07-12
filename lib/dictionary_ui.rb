
class DictionaryUI

  def initialize
    @path = ''
  end

  def run
    prompt_user
    get_input
  end

  def prompt_user
    puts "Where is your dictionary? ('q' to quit)"
  end

  def get_input
    input = gets.chomp
    exit if input == 'q'
    @path=input
  end
end

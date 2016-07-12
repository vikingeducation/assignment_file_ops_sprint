class Dictionary
  attr_reader :dictionary
  
  def initialize
    @dictionary = DictionaryLoader.new
    run
  end

  def run
    puts "Dictionary succesfully loaded"
    

  end

end
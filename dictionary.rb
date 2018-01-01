
# Dictionary is the class which wraps the loaded dictionary.

class Dictionary
  attr_reader :dictionary

  def initialize(file)
    @dictionary = file
  end
end

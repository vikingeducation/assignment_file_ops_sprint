
# Dictionary is the class which wraps the loaded dictionary.

class Dictionary
  include Enumerable

  attr_reader :dictionary

  def initialize(file)
    @dictionary = file
  end

  def each(proc = nil)
    @dictionary.each { |word| block_given? ? yield(word) : proc.call(word) }
  end
end

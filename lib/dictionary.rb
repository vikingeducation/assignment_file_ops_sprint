# dictionary.rb

class Dictionary
  include Enumerable

  def initialize(arr_dictionary)
    @dictionary = arr_dictionary
  end

  def each
    @dictionary.each
  end

  def [](index)
    @dictionary[index]
  end

end


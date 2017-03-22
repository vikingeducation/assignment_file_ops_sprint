# Dictionary.rb

class Dictionary
  attr_accessor :words, :stats, :length, :location

  def initialize(dictionary_location)
    @location = dictionary_location
    @words = []
    @stats = {}
    @length = 0
  end
end

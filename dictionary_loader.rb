
=begin
 DictionaryLoader is a helper class whose single responsibility is to load
 in the dictionary.
=end

require "./dictionary.rb"

class DictionaryLoader
  attr_reader :read

  def initialize(path)
    @path = path
    fetch
  end

  def fetch
# need to do something about files that can't be found
    file = File.readlines(@path).map(&:strip)
    @read = Dictionary.new(file)
  end
end

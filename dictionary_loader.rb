
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
    if File.file?(@path)
      file = File.readlines(@path).map(&:strip)
      @read = Dictionary.new(file)
    else
      @read = 0
    end
  end
end

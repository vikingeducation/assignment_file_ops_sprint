
=begin
 DictionaryLoader is a helper class whose single responsibility is to load
 in the dictionary.
=end

require "./dictionary.rb"

class DictionaryLoader
  attr_reader :read

  def initialize(path)
    fetch(path)
  end

  def fetch(file_path)
    file = File.foreach(file_path).map { |word| word.strip.downcase }
    @read = Dictionary.new(file)
  end
end

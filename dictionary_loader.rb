require "set"
require_relative "dictionary"

# loads in the dictionary
class DictionaryLoader

  def load(path)
    dict = Set.new
    File.readlines(path).each do |line|
      dict.add(line.strip)
    end
    Dictionary.new(dict)
  end

end

# helper class. single responsibility is to load the dictionary
require_relative 'dictionary'

class DictionaryLoader
  def self.load(file_path)
    entries = File.readlines(file_path).each do |word|
      word = word.strip!
    end
    puts "Dictionary successfully loaded!"
    Dictionary.new(entries)
  end
end

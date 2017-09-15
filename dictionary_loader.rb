# helper class whose single responsibility is to load in the dictionary
require './dictionary'

module DictionaryLoader

  def self.create(path)
    while !File.exist?(path)
      puts "Error: Invalid path."
      puts "Try again:"
      path = gets.chomp
    end
    entries = File.readlines(path).map(&:strip)
    Dictionary.new(entries)
  end

end

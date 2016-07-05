require 'pry'
class DictionarySearcher

  def self.search(object, type, term)
    result = case type
    when 1
     object.dict.keys.select { |str| str[/^#{term}$/] }
    when 2
      object.dict.keys.select { |str| str[/#{term}/] }
    when 3
      object.dict.keys.select { |str| str[/^#{term}/] }
    when 4
      object.dict.keys.select { |str| str[/#{term}$/] }
    else
      puts "Invalid search type!"
    end

    if result.size != 0
      puts "Found #{result.size} matches"
      result.each { |w| puts w }
    else
      puts "No results found"
    end
  end

end
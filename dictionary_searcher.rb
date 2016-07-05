class DictionarySearcher
  def self.search(object, type, term)
    type_mapping = { 1 => "^" + term + "$", 2 => term, 3 => "^" + term, 4 => term + "$" }
    result = object.dict.keys.select { |str| str[/#{type_mapping[type]}/] }
    if result.size != 0
      puts "Found #{result.size} matches"
      result.each { |w| puts w }
    else
      puts "No results found"
    end
  end
end

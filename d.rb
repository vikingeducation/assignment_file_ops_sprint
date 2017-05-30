class DictionaryUI

  def input_path
    @file_path = input "Where's your dictionary?"
    @file_path.empty? ? "5desk.txt" : @file_path
  end

  def show_stats(stats)
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{stats[:total]} words."
    puts "Word frquency by starting letter"
    stats.each_pair {| key, value |
      puts "#{key} #{value}"
     }
  end

  def search_menu
    menu_item = nil
    while ! ["x","p","b","e"].include?(menu_item) do
      menu_item = input "Enter your search type: eXact, Partial, Begins with, Ends with"
    end
    search_term = input "Enter the term to search"
    return menu_item, search_term
  end

  def search_response(response)
    if response.length == 0
      puts "Term not found"
    else
      puts "Term has been found #{response.length} times"
      response.each do |word|
        puts word
      end
    end
  end

  private

  def input(prompt)
    print "#{prompt}: "
    gets.chomp
  end
end

class DictionaryLoader
  @words = Array.new(1)
  def run
    d = DictionaryUI.new
    @file_path = d.input_path
    File.open(@file_path, "r") do |file|
      @words = file.readlines
    end
    @words.each do |word|
      word.chomp!
    end
  end
end

class Dictionary
  def initialize
    @interface = DictionaryUI.new
    @loader = DictionaryLoader.new
    @contents = @loader.run
    @analizer = DictionarySearcher.new
    stats = @analizer.stats(@contents)
    @interface.show_stats(stats)
    menu_item, search_term = @interface.search_menu
    search_hub(menu_item, search_term)
  end

  def search_hub(menu_item, search_term)
    if menu_item == "x"
      response = @analizer.exact_search(search_term, @contents)
    elsif menu_item == "p"
      response = @analizer.partial_search(search_term, @contents)
    elsif menu_item == "b"
      response = @analizer.begins_with(search_term, @contents)
    elsif menu_item == "e"
      response = @analizer.ends_with(search_term, @contents)
    else
      raise(ArgumentError)
    end
    @interface.search_response(response)
  end

end

class DictionarySearcher
  @@ALPHABET = ("a".."z").to_a
  def stats(contents)
    total = contents.length
    stat_hash = Hash.new(0)
    i = 0
    j = 0
    while i < total do
      word = contents[i].downcase
      letter = @@ALPHABET[j]
      while word[0] != letter do
        j+= 1
        letter = @@ALPHABET[j]
      end
      stat_hash[letter.to_sym] += 1
      i+=1
    end
    stat_hash[:total] = total
    stat_hash
  end

  def exact_search(term, contents)
    response = []
    contents.each do |word|
      if word.downcase == term.downcase
        response << word
        # allows for repeated entries in dictionary, useful to find duplicates
      end
    end
    response
  end

  def partial_search(term, contents)
    string = contents.join("\n")
    regex = Regexp.new(".*#{term}.*","i")
    results = string.scan(regex)
  end

  def begins_with(term, contents)
    string = contents.join("\n")
    regex = Regexp.new("^#{term}.*","i")
    results = string.scan(regex)
  end

  def ends_with(term, contents)
    string = contents.join("\n")
    regex = Regexp.new(".*#{term}$","i")
    results = string.scan(regex)
  end

end

class ResultSaver
end

Dictionary.new

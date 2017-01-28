# perform analysis on the dictionary you provide it
class DictionarySearcher

  attr_reader :dict

  def initialize(dict)
    @dict = dict
  end

  def run
    search_type = prompt_search_type()
    search_term = prompt_search_term()
    result = run_search(search_type, search_term)
    output_result(result)
  end

  def output_result(result)
    if result
      puts ""
      puts "Found #{result.count} matches"
      result.each { |item| puts item }
    else
      puts "No matches"
    end
  end

  def prompt_search_type
    info_txt = ["What kind of search?", "1: Exact", "2: Partial",
    "3: Begins With", "4: Ends With"]
    info_txt.each{ |i| puts i }
    print "> "
    gets.strip.to_i
  end

  def prompt_search_term
    puts ""
    puts "Enter the search term"
    print "> "
    gets.strip
  end

  def run_search(search_type, search_term)
    result = case search_type
    when 1
      member(search_term)
    when 2
      partial(search_term)
    when 3
      begins_with(search_term)
    when 4
      ends_with(search_term)
    end
  end

  def member(search_term)
    if dict.dict.include?(search_term)
      [search_term]
    end
  end

  def partial(search_term)
    dict.dict.reduce([]) do |acc, word|
      if result = word.match(/#{search_term}/)
        acc << word
      else
        acc
      end
    end
  end

  def begins_with(search_term)
    dict.dict.reduce([]) do |acc, word|
      if result = word.match(/^#{search_term}/)
        acc << word
      else
        acc
      end
    end
  end

  def ends_with(search_term)
    dict.dict.reduce([]) do |acc, word|
      if result = word.match(/#{search_term}$/)
        acc << word
      else
        acc
      end
    end
  end

end

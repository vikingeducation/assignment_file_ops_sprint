require_relative 'dictionary'
# Performs searches in dictionary instance
class DictionarySearcher
  def initialize(dict_to_search)
    @dict = dict_to_search
    @command = 0
    @search_term = ''
    @search_results = []
  end

  def search
    prompt_search_type
    run_search(search_regex)
    puts "\nFound #{@search_results.length} matches:"
    puts @search_results

    reset
  end

  private

  def prompt_search_type
    valid_commands = [1, 2, 3, 4]
    puts "\nWhat kind of search?"
    puts '1: Exact'
    puts '2: Partial'
    puts '3: Begins with'
    puts '4: End with'
    @command = gets.strip.to_i until valid_commands.include?(@command)
    puts 'Enter search term: '
    @search_term = gets.strip while @search_term.empty?
  end

  def search_regex
    case @command
    when 1
      regex_str = '^' + @search_term + '$'
    when 2
      regex_str = '^\w+' + @search_term + '\w+'
    when 3
      regex_str = '^' + @search_term + '\w+'
    when 4
      regex_str = '\w+' + @search_term + '$'
    end
    Regexp.new regex_str
  end

  def run_search(regex_str)
    @dict.each do |word|
      @search_results << word if word.match(regex_str)
    end
  end

  def reset
    @command = 0
    @search_term = ''
    @search_results = []
  end
end

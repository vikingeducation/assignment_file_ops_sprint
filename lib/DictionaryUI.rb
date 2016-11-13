require_relative 'Dictionary'
require_relative 'DictionaryLoader'
require_relative 'DictionarySearcher'
require_relative 'ResultsSaver'
require 'pry'
require 'pry-byebug'


class DictionaryUI

  def initialize
    puts "Welcome to Dictionary"
  end

  def prompt_for_file_path
    print "Enter file path of dictionary \n > "
    path = gets.chomp
    path = "5desk.txt" if path == ""
    path
  end

  def prompt_for_search
    choice = nil
    
    until (1..4).include?(choice)
      puts "What kind of search would you like to perform?"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With"
      puts "4: Ends With"
      choice = gets.chomp.to_i
    end

    choice

  end

  def prompt_for_term
    print "Enter search query \n > "
    gets.chomp.downcase
  end

  def search_results(search_kind, term, dict)
    ds = DictionarySearcher.new(dict)
    ds.search(search_kind, term)
  end

  def main
    path = prompt_for_file_path
    dict = DictionaryLoader.createDictionaryFrom(path)
    search_kind = prompt_for_search
    term = prompt_for_term
    search_results(search_kind, term, dict)
  end

end

DictionaryUI.new.main

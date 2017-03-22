# DictionaryUI.rb
require_relative 'Dictionary'
require_relative 'DictionaryLoader'
require_relative 'DictionarySearcher'

class DictionaryUI
  def run
    system 'clear'
    puts 'Where is your dictionary? (q to quit)'
    dictionary_location = gets.chomp
    puts

    continue = check_result(dictionary_location)
    if continue
      test_loc = '/Users/mattyb/code/5desk.txt'
      dl = DictionaryLoader.new test_loc
      dictionary = dl.load_it
      ds = DictionarySearcher.new dictionary
      ds.run_search
    end
    puts 'good bye.'
  end

  def check_result(answer)
    return false if answer.casecmp('q').zero?
    true
  end
end

dui = DictionaryUI.new
dui.run

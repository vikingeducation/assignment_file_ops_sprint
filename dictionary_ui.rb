require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'dictionary'
require_relative 'results_saver'
require 'yaml'

class DictionaryUI

  def initialize
    @loader = DictionaryLoader.new
    @searcher = DictionarySearcher.new
    @saver = ResultsSaver.new
  end

  def run
    loop do
      puts "Where is your dictionary? ('q' to quit)"
      user_input = gets.chomp
      break if user_input.downcase == 'q'
      dictionary = @loader.load_file(user_input)
      choice = @searcher.search_choice
      break if choice == 'q'
      results = @searcher.search dictionary, choice

      s_choice = @saver.save_choice
      break if s_choice == 'q'
      next if s_choice == 'n'
      s_file_path = @saver.save_file_path

      if @saver.file_existence s_file_path
        o_choice = @saver.overwrite_choice
        break if o_choice == 'q'
        next if o_choice == 'n'
        @saver.save results, s_file_path
      else
        @saver.save results, s_file_path
      end
    end
  end

end

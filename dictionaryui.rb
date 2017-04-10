# main class - handles the user interactions loop
require_relative 'dictionary'
require_relative 'dictionary_searcher'
require_relative 'results_saver'

class DictionaryUI

  def initialize
    @search_type_hash = {
      :exact => 1,
      :partial => 2,
      :begins_with => 3,
      :ends_with => 4
    }
  end

  def run
    get_dictionary
    run_search_loop
  end


  private


  def run_search_loop
    loop do
      puts "What kind of search? (or enter 'q' to quit)"
      @search_type_hash.each do |key, value|
        puts "#{value}: #{key}"
      end
      type_of_search = gets.chomp
      if type_of_search == "q"
        exit
      elsif type_of_search =~ /[^1-4,q]/
        puts "That is not a valid entry please try again (please enter answer in form 1, 2, 3, 4, or 'q')."
        next
      else
        get_search_term
        case type_of_search
        when "1"
          @search.exact_matches
        when "2"
          @search.partial_matches
        when "3"
          @search.begins_with
        when "4"
          @search.ends_with
        end
      end
      save_results
      puts "Would you like to perform another search? y? or n/q to quit."
      answer = gets.chomp.downcase
      if answer == "y"
        next
      else
        exit
      end
    end
  end   # end of run loop method


  def get_dictionary
    loop do
      puts "Where is your dictionary? (or'q' to quit)"
      path = gets.chomp
      if path == 'q'
        exit
      elsif File.exists?(path) == true
        d = Dictionary.new(path)
        puts "Dictionary loaded successfully."
        @current_dictionary = d.dictionary_wrap
        break
      else
        puts "That is not a valid file, please re-enter"
      end
    end
  end


  def get_search_term
      puts "Enter search term:"
      search_term = gets.chomp.upcase
      @search = DictionarySearcher.new(search_term, @current_dictionary)
  end


  def save_results
    try_again = false
    until try_again != false
      puts "***"
      puts "Would you like to save results? y/n? or 'q' to quit."
      answer = gets.chomp
      case answer.downcase
      when "q"
        puts "These results will not be saved, good bye."
        exit
      when "n"
        puts "These results will not be saved."
        try_again = false
        return false
      when "y"
        get_save_path
        if @results_to_save.file_exists? == false
          @results_to_save.save_file
          puts "File saved successfully"
          return true
        else
          puts "This file already exists, would you like to overwrite it? y/n? or 'q' to quit."
          overwrite_answer = gets.chomp
          case overwrite_answer.downcase
          when "y"
            @results_to_save.save_file
            puts "File succesfully overwritten!"
            return true
          when "q"
            puts "These results will not be saved, good bye"
            exit
          when "n"
            next
          end
        end
        try_again = false
        return true
      else
        puts "That is not a valid input, lets try again shall we..."
        try_again = true
      end
    end
  end


  def get_save_path
      r_array = @search.results_array
      puts "What file path would you like to write the results to?"
      save_pathway = gets.chomp
      @results_to_save = ResultsSaver.new(save_pathway, r_array)
  end

end # end of class


nd = DictionaryUI.new
nd.run

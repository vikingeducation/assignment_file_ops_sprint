require 'pry'
require 'yaml'

class DictionaryAnalyzer
  attr_accessor :return_values
  def initialize(dictionary_input)
    @current_dictionary = dictionary_input
    word_count(dictionary_input)
    letter_data(dictionary_input)
    @return_values = []
    @match_counter = 0
  end

  def word_count(input)
    answer = input.length
    puts "There are #{answer} words in this dictionary.\n"
  end

  def letter_data(input)
    ("a".."z").each do |regex|
      regex_big = regex.upcase
      letter_count = (input.join("\n").scan(/^#{regex}/).size + input.join("\n").scan(/^#{regex_big}/).size) #regex hates me letter_counter_helper(input, regex) #
      puts "There are #{letter_count} words under the letter #{regex}"
    end
  end

  def user_search_choices
      #pick user choice
    user_choice = "nothing"
    until user_choice.downcase == "q"
      puts "You may now search this file's dictionary! If you want to search for an exact match, enter '1', for a partial match, enter '2', '3' if it's the beginning of the word and '4' if it's the end of the word you are looking for! Type 'q' to exit any time!"
      @return_values = []
      @match_counter = 0
      user_choice = gets.chomp
      exit if user_choice.downcase == "q"
      puts "Great, now what is your search term?"
      # binding.pry
      search_term = gets.chomp
      if user_choice == "1"
          exact_matches(search_term)
      elsif user_choice == "2"
          partial_matches(search_term)
      elsif user_choice == "3"
          begins_with(search_term)
      elsif user_choice == "4"
          ends_with(search_term)
      end
    end
  end

  def exact_matches(input)
    @current_dictionary.each do |line|
      if line == input
        @return_values << line
        @match_counter += 1
      end
    end
    display_or_save(@match_counter, @return_values)
  end

  def partial_matches(input)
    @current_dictionary.each do |line|
      if line =~ /#{input}/
        @return_values << line
        @match_counter += 1
      end
    end
    display_or_save(@match_counter, @return_values)
  end

  def begins_with(input)
    @current_dictionary.each do |line|
      if line =~ /^#{input}/
        @return_values << line
        @match_counter += 1
      end
    end
    display_or_save(@match_counter, @return_values)
  end

  def ends_with(input)
    @current_dictionary.each do |line|
      if line =~ /#{input}$/
        @return_values << line
        @match_counter += 1
      end
    end    
    display_or_save(@match_counter, @return_values)
  end

  def display_or_save(counter, output)
    puts "There are #{counter} matches, do you want to 'save' or 'display'?"
    save_or_display = gets.chomp
    until save_or_display.downcase == "save" || save_or_display.downcase == "display"
      puts "Error, unknown command. Type 'save' or 'display', please"
      save_or_display = gets.chomp
    end
    if save_or_display == "display"
      puts output
    elsif save_or_display == "save"
      puts "What filename do you want? (remember to end with .txt)"
      filename = gets.chomp
      File.open(filename,"w") do |file|
        file.write output
      end
    end
  end


      #Only use below as helper if regex starts to hate you
  # def letter_counter_helper(ary, letter_to_check)
  #   counter = 0
  #   ary.each do |word|
  #     if word[0].upcase == letter_to_check.upcase
  #       counter += 1
  #     end
  #   end
  #   return counter
  # end
end
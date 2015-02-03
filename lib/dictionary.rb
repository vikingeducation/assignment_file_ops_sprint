require './dictionaryloader.rb'
require './dictionaryanalyzer.rb'
require 'pry'
require 'yaml'

class Dictionary
  attr_accessor :user_dictionary, :chosen_dictionary, :data_result
  def initialize
    welcome
    @chosen_dictionary = DictionaryLoader.new(@user_dictionary).dictionary_array
    @data_result = DictionaryAnalyzer.new(@chosen_dictionary)
    @data_result.user_search_choices
  end


  def welcome
    puts "Howdy user! What is the name of your dictionary file?"
    @user_dictionary = gets.chomp.to_s
  end

  def quits?
    puts "Would you like to quit? (y/n)"
    quitter_input = gets.chomp.downcase
    if quitter_input == "y"
      exit
    else
      Dictionary.new
    end
  end
end
schwad = Dictionary.new
schwad
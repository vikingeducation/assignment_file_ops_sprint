# holds a list of words
class Dictionary
  attr_reader :words

  def initialize(words = [])
    @words = words
  end

  def word_count
    @words.length
  end
end

#reads in dictionary from file and creates Dictionary
class DictionaryLoader

  def self.load(filename)
    word_list = []

    File.readlines(filename).each do |line|
      word_list << line.strip
    end

    word_list
  end

end

# finds matches in Dictionary
class DictionarySearcher
end

# saves results to disk
class ResultsSaver
end

# controls functions based on input
class DictionaryUI

  def initialize
  end

  def run
    filename = prompt_filename
    abort if quit?(filename) 
    dict = DictionaryLoader.load(filename)
    display_stats(dict)
    loop do
      option_choice = display_options
      abort if quit?(option_choice)
      results = []
      case option_choice
      when 1
        #Exact matches
      when 2
        #Partial matches
      when 3
        #Begins_with
      when 4
        #Ends_with
      end
      display_results(results)
      save?(results)
    end
  end

  def prompt_filename
    puts "Where's your dictionary?"
    gets.chomp
  end

  private 

    def quit?(user_input)
      inp = user_input.downcase
      inp == 'quit' || inp == 'q'
    end

    def display_stats(dictionary)
      puts "Your dictionary contains #{dictionary.word_count} words."
    end
    
# ask for filename
# load file
# display_statistics
# loop for UI (end condition: quit)
  # display_options
  # ask_for_choice
  # query based on choice
  # display_results
  # ask_save?
# end

end
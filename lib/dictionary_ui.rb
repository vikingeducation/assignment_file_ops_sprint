require_relative 'dictionary'
require_relative 'dictionary_loader'

class DictionaryUI
  attr_accessor :path

  def initialize
    @path = nil
    run
  end

  def run
    puts 'Where is your dictionary? (\'q\' to quit)'
    get_path
    @dictionary_file = DictionaryLoader.load_dict(@path)
    @dictionary = Dictionary.new(@dictionary_file)
    searcher = DictionarySearcher.new(@dictionary)
    load_message
    match_prompt
    loop do
      search_choice = gets.chomp
      break if valid_input?(search_choice)
    end
    # prompt for another search or save
  end

  def get_path
    @path = gets.chomp
  end

  def load_message
    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{@dictionary.word_count} words."
    puts "Word frequency by starting letter:"
    @dictionary.freq_start_letters.each do |letter, count|
      puts "#{letter.upcase}: #{count}"
    end
    puts
  end

  def match_prompt
    puts "What kind of search?"
    puts "1: Exact"
    puts "2: Partial"
    puts "3: Begins With"
    puts "4: Ends With"
  end

  def valid_input?(input)
    %w(1 2 3 4).include? input
  end

  def get_match_type(input)
    case input
    when "1"
      @searcher.(inp)
    end
  end


end

t = DictionaryUI.new
